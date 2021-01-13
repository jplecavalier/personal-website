library(data.table)
library(sf)

# Load raw data
ada <- st_read("~/data/statcan/census/2016/boundaries/digital/ada/lada000a16a_e.shp") %>% setDT()
da <- st_read("~/data/statcan/census/2016/boundaries/digital/da/lda_000a16a_e.shp") %>% setDT()

coastal <- st_read("~/data/statcan/census/2016/boundaries/water/coastal/lhy_000h16a_e.shp") %>% setDT()
rivers <- st_read("~/data/statcan/census/2016/boundaries/water/rivers/lhy_000c16a_e.shp") %>% setDT()

profile_cd_csd_da <- fread("~/data/statcan/census/2016/profile/cd-csd-da/qc/98-401-X2016044_QUEBEC_English_CSV_data.csv")
profile_ada <- fread("~/data/statcan/census/2016/profile/ada/98-401-X2016050_English_CSV_data.csv")

# Clean digital boundaries
ada_qc <- ada[CDUID=="2423", .(ADAUID, geometry)][, geometry:=st_make_valid(geometry)][, geometry:=st_cast(st_sfc(lapply(geometry, identity), crs=st_crs(geometry)), "MULTIPOLYGON")]
da_qc <- da[CDUID=="2423", .(DAUID, geometry)][, geometry:=st_make_valid(geometry)][, geometry:=st_cast(st_sfc(lapply(geometry, identity), crs=st_crs(geometry)), "MULTIPOLYGON")]

# Clean hydro boundaries
coastal_qc <- coastal[which(sapply(st_intersects(geometry, ada_qc[, st_union(geometry)]), length)==1L), .(HYDROUID, geometry)][, geometry:=st_cast(st_intersection(geometry, ada_qc[, st_union(geometry)]), "MULTIPOLYGON")]
rivers_qc <- rivers[which(sapply(st_intersects(geometry, ada_qc[, st_union(geometry)]), length)==1L), .(HYDROUID, geometry)][, geometry:=st_cast(st_intersection(geometry, ada_qc[, st_union(geometry)]), "MULTIPOLYGON")]
hydro_qc <- rbindlist(list(coastal_qc, rivers_qc))[st_area(geometry)>units::set_units(100000, "m^2")][, geometry:=st_sfc(lapply(geometry, identity), crs=st_crs(geometry))]

# Clean profile data
error_code <- c("x", "F", "..", "...")

income_ada <- profile_ada[`Member ID: Profile of Aggregate Dissemination Areas (2247)`==742L & GEO_LEVEL==3L & substr(`GEO_CODE (POR)`, 1L, 4L)%in%c("2423", "2425"), .(
  type       = "ada",
  id         = as.character(`GEO_CODE (POR)`),
  med_income = `Dim: Sex (3): Member ID: [1]: Total - Sex`
)][med_income%in%error_code, med_income:=NA_character_][, med_income:=as.integer(med_income)]

income_da <- profile_cd_csd_da[`Member ID: Profile of Dissemination Areas (2247)`==742L & GEO_LEVEL==4L & substr(`GEO_CODE (POR)`, 1L, 4L)%in%c("2423", "2425"), .(
  type       = "da",
  id         = as.character(`GEO_CODE (POR)`),
  med_income = `Dim: Sex (3): Member ID: [1]: Total - Sex`
)][med_income%in%error_code, med_income:=NA_character_][, med_income:=as.integer(med_income)]

medincome_qc <- rbindlist(list(income_ada, income_da))
medincome_qc[, type:=as.factor(type)]

# Write data
st_write(st_as_sf(ada_qc), "content/post/20210102-pimp-your-maps/data/ada_qc.shp")
st_write(st_as_sf(da_qc), "content/post/20210102-pimp-your-maps/data/da_qc.shp")
st_write(st_as_sf(hydro_qc), "content/post/20210102-pimp-your-maps/data/hydro_qc.shp")
fwrite(medincome_qc, "content/post/20210102-pimp-your-maps/data/medincome_qc.csvy", yaml=TRUE)
