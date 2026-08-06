# Скачивание синоптических карт ----------------------------------------------------
## НУЖНО ЗАПУСКАТЬ СКРИПТ КАЖДЫЙ ДЕНЬ, РАЗ В СУТКИ!!!
site <- "https://meteoinfo.ru/hmc-input/mapsynop/"
vec_spisok <- c("Analiz", "Analiz00h", "Analiz06h", "Analiz12h", "Analiz18h", "Analizsp",
                 "Min", "Max", "Precip", "OT500-1000-00", "AT-925-00", "AT-850-00", "AT-700-00",
                 "AT-500-00", "AT-400-00", "AT-300-00", "AT-200-00",
                 "AT-100-00", "OT500-1000-12", "AT-925-12", "AT-850-12", "AT-700-12", "AT-500-12",
                 "AT-400-12", "AT-300-12", "AT-200-12", "AT-100-12")

papka <- "maps_archive/" 
t <- format(Sys.time(), "%a %b %e %Y")
file_path <- paste0(papka, t, "/")


dir.create(path = file_path)

for (i in 1:27){
   urlki <- paste0(site, vec_spisok[i], ".png")
   file_name <- paste0(vec_spisok[i], ".png")
   try(download.file(url = urlki, destfile = paste0(file_path, file_name, sep = ""), mode = "wb"))
}