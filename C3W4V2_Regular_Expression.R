mystr<-c("i think, sachin can teach Java.",
          "I know, JAVA is programming language.",
          "i think, Sachin has created java notes.",
          "I am sure he has created notes",
          "SACHIN's notes are good",
          "6 years of teaching experience he has",
          "7th year is running",
          "3RD year diploma has java subject",
          "i am going to join.",
          "are you?")

# if need to find starting with "i think" use ^ (caret) Symbol before "i think".
grep("^i think",mystr,value = TRUE)

# if need to find ending with "good" use $ (Dollar) symbol after "good"
grep("good$",mystr,value = TRUE)

# if you need to find Java/JAVA/java in any possible combination of cases.
grep("[Jj][Aa][Vv][Aa]",mystr,value = TRUE)

# if you want text starting with either capital or small "I" followed by am.
grep("^[Ii] am",mystr,value = TRUE)

# if you need string starting with any number followed by any capital or small letter. 
grep("^[0-9][a-zA-z]",mystr,value = TRUE)

# if you need all sentences ending with either ? or . 
grep("[?.]$",mystr,value = TRUE)
grep("[^?.]$",mystr,value = TRUE)