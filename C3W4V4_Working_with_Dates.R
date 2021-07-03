install.packages("lubridate")
library(lubridate)


# way of getting date

  #1.
    d1=date()
    d1
    class(d1)
  
  #2.
    d2 = Sys.Date()
    d2
    class(d2)
    
# Formating Dates
  # %d = day as numbers (1 - 31)
  # %m = month as number (1 - 12)
  # %y = 2 digit year (00 - 99)
  # %Y = 4 digit year (1920 - 2020)
  # %a = abbreviated weekday (Sun - Mon)
  # %A = unabbreviated weekday (Sunday - Monday)
  # %b = abbreviated Month (Jan - Dec)
  # %B = unabbreviated Month (January - December)
    
    format(d2,"%a %b %d")
    
# Creating dates
  x=c("1jan1960","1mar1960","12jun1965")
  z=as.Date(x,"%d%b%Y")
  z
  
  y=dmy(x)   # Lubridate Package function
  y
  
  # Time difference between 2 dates
  z[3] - z[2]
  z[2] - z[1]
  
  as.numeric(z[2]-z[1])
  
# other operations
  weekdays(d2)
  months(d2)
  
  wday(y[1])      # Lubridate Package function
  wday(y[1],label = TRUE)
  
  
# Converting to Julian  
  julian(d2)
  
# Lubridate Package

  ymd(Sys.Date())
  ymd(20201018)
  mdy("10/18/2020")
  dmy("18-10-2020")
  ymd_hms(20201018172730)
  
  ymd_hms("2020/10/18 17:30:20",tz = "Asia/Kolkata")
  