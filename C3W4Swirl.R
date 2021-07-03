# Dates and Times with lubridate
Sys.getlocale("LC_TIME")
library(lubridate)
help(package = lubridate)

# today() and now() provide neatly formatted date-time information.

this_day<-today()
this_day

year(this_day)
month(this_day)
day(this_day)

wday(this_day)
wday(this_day,label = TRUE)

this_moment<-now()
this_moment

hour(this_moment)
minute(this_moment)
second(this_moment)


my_date<-ymd("1989-05-17")
my_date
class(my_date)

ymd("1989 May 17")
mdy("March 12, 1975")
dmy(25081985)

ymd("192012") # when it unclear
ymd("1920/1/2") # provide additional detail

dt1<-"2014-08-23 17:23:02"
dt1

ymd_hms(dt1)

hms("03:22:14")

dt2<-c("2014-05-14","2014-09-22","2014-07-11")

ymd(dt2)

update(this_moment,hours = 8, minutes = 34, seconds = 55)
this_moment

this_moment<-update(this_moment, hours=hour(this_moment)+1, minutes=minute(this_moment)+5)
this_moment


# Pretend you are in New York and planning to visit your friend in Hong Kong.
# You know your flight depart New York at 17:34 (5:34 PM) the day after tomorrow
# You also know that your flight is scheduled to arrive in Hong Kong exactly 15 hrs and 50 min after departure

# Take current time of New York
nyc<-now("America/New_York")
nyc

# Add 2 days in it and save it in depart variable
depart <- nyc+days(2)
depart

# update time to 17:34 of depart
depart<- update(depart, hours=15,minutes=34)
depart

# add flight time i.e. 15 hrs and 50 min to get arrival time.
arrival<-depart+hours(15)+minutes(50)
arrival

# translate it to Hong Kong local time so your friend can pick you up.
arrival<-with_tz(arrival,tzone = "Asia/Hong_Kong")
arrival

#Now you reached at hong Kong and meet to friend
#after meeting both of you calculating how much time has passed since last meeting
#last meeting at Singapore on June 17 2008

# creating variable for last meeting date
last_time<- mdy("June 17, 2008",tz = "Singapore")
last_time

# Calculating interval from last meeting to current time i.e. arrival
how_long<-interval(last_time,arrival)

# Translating it to time.

as.period(how_long)