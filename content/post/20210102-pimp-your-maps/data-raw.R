library(data.table)
library(sf)

# Load raw data
cd <- st_read("~/data/statcan/census/2016/boundaries/digital/cd/lcd_000a16a_e.shp") %>% setDT()
ada <- st_read("~/data/statcan/census/2016/boundaries/digital/ada/lada000a16a_e.shp") %>% setDT()
da <- st_read("~/data/statcan/census/2016/boundaries/digital/da/lda_000a16a_e.shp") %>% setDT()

coastal <- st_read("~/data/statcan/census/2016/boundaries/water/coastal/lhy_000h16a_e.shp") %>% setDT()
rivers <- st_read("~/data/statcan/census/2016/boundaries/water/rivers/lhy_000c16a_e.shp") %>% setDT()

profile_cd_csd_da <- fread("~/data/statcan/census/2016/profile/cd-csd-da/qc/98-401-X2016044_QUEBEC_English_CSV_data.csv")
profile_ada <- fread("~/data/statcan/census/2016/profile/ada/98-401-X2016050_English_CSV_data.csv")

# Clean digital boundaries
cd_qclevis <- cd[CDUID%in%c("2423", "2425"), .(CDUID, geometry)][, geometry:=st_make_valid(geometry)][, geometry:=st_cast(st_sfc(lapply(geometry, identity), crs=st_crs(geometry)), "MULTIPOLYGON")]
ada_qclevis <- ada[CDUID%in%c("2423", "2425"), .(ADAUID, geometry)][, geometry:=st_make_valid(geometry)][, geometry:=st_cast(st_sfc(lapply(geometry, identity), crs=st_crs(geometry)), "MULTIPOLYGON")]
da_qclevis <- da[CDUID%in%c("2423", "2425"), .(DAUID, geometry)][, geometry:=st_make_valid(geometry)][, geometry:=st_cast(st_sfc(lapply(geometry, identity), crs=st_crs(geometry)), "MULTIPOLYGON")]

# Clean hydro boundaries
coastal_qclevis <- coastal[which(sapply(st_intersects(geometry, cd_qclevis[, st_union(geometry)]), length)==1L), .(HYDROUID, geometry)][, geometry:=st_cast(geometry, "MULTIPOLYGON")]
rivers_qclevis <- rivers[which(sapply(st_intersects(geometry, cd_qclevis[, st_union(geometry)]), length)==1L), .(HYDROUID, geometry)]
hydro_qclevis <- rbindlist(list(coastal_qclevis, rivers_qclevis))[, geometry:=st_cast(st_sfc(lapply(geometry, identity), crs=st_crs(geometry)), "MULTIPOLYGON")]

# Clean profile data
error_code <- c("x", "F", "..", "...")

income_cd <- profile_cd_csd_da[`Member ID: Profile of Dissemination Areas (2247)`==742L & `GEO_CODE (POR)`%in%c("2423", "2425"), .(
  type       = "cd",
  id         = as.character(`GEO_CODE (POR)`),
  med_income = `Dim: Sex (3): Member ID: [1]: Total - Sex`
)][med_income%in%error_code, med_income:=NA_character_][, med_income:=as.integer(med_income)]

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

medincome_qclevis <- rbindlist(list(income_cd, income_ada, income_da))
medincome_qclevis[, type:=as.factor(type)]

# Write data
st_write(st_as_sf(cd_qclevis), "content/post/20201214-pimp-your-maps-intro/data/cd_qclevis.shp")
st_write(st_as_sf(ada_qclevis), "content/post/20201214-pimp-your-maps-intro/data/ada_qclevis.shp")
st_write(st_as_sf(da_qclevis), "content/post/20201214-pimp-your-maps-intro/data/da_qclevis.shp")
st_write(st_as_sf(hydro_qclevis), "content/post/20201214-pimp-your-maps-intro/data/hydro_qclevis.shp")
fwrite(medincome_qclevis, "content/post/20201214-pimp-your-maps-intro/data/medincome_qclevis.csvy", yaml=TRUE)
