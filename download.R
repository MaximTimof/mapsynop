# 
site <- "https://meteoinfo.ru/hmc-input/mapsynop/"
vec_spisok <- c("Analiz", "Analiz00h", "Analiz06h", "Analiz12h", "Analiz18h", "Analizsp",
                 "Min", "Max", "Precip", "OT500-1000-00", "AT-925-00", "AT-850-00", "AT-700-00",
                 "AT-500-00", "AT-400-00", "AT-300-00", "AT-200-00",
                 "AT-100-00", "OT500-1000-12", "AT-925-12", "AT-850-12", "AT-700-12", "AT-500-12",
                 "AT-400-12", "AT-300-12", "AT-200-12", "AT-100-12")

papka <- "maps_archive/" 
t <- format(Sys.time(), "%Y-%m-%d")
file_path <- paste0(papka, t, "/")

dir.create(path = file_path, recursive = TRUE, showWarnings = FALSE)

#User-Agent
options(HTTPUserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")

for (i in 1:length(vec_spisok)){
   urlki <- paste0(site, vec_spisok[i], ".png")
   file_name <- paste0(vec_spisok[i], ".png")
   dest <- paste0(file_path, file_name)
   
   print(paste("Скачиваю:", urlki))
   
   #
   result <- try(download.file(url = urlki, destfile = dest, mode = "wb", quiet = TRUE))
   
   if (inherits(result, "try-error")) {
      print(paste("Ошибка при скачивании файла:", file_name))
   }
}

# 
files_count <- length(list.files(file_path))
print(paste("Всего успешно скачано файлов:", files_count))

if (files_count == 0) {
   stop("Ни один файл не был скачан! Принудительная остановка скрипта.")
}
