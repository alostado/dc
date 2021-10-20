library(pushoverr)
library(lubridate)
library(rvest)

webpage = read_html("https://www.goarch.org/chapel/calendar")

txt = stringr::str_split(webpage %>% html_nodes(".cal-day.today") %>% 
                           html_text(), pattern = "\n")

txt = unlist(txt)

txt = txt[txt != ""]

if (Sys.Date() == as.Date(txt[2], format = "%A, %B %d, %Y")){
  title = stringr::str_glue("Fasting: ", txt[3])
  message = txt[4]
}


pushover(title = title, message = message)

# Conversion Julian to Gregorian ----

# dates = seq(as.Date("2021-03-21"), as.Date("2021-03-21")+28, by=1)
# 
# moon = lunar::lunar.phase(dates)
# 
# easter = seq(dates[min(which(moon >= pi))] + 1, dates[min(which(moon >= pi))] + 1 + 6, by=1)
# 
# easter[which(weekdays(easter) == "Sunday")]
