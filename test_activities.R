A1_Stu
library(tidyverse)

students <- c('Abraham', 'Beatrice', 'Cory', 'Dinah', 'Eric', 'Felicia')  
typeof(students)

attendence_sheet <- function(class) {
    print(Sys.Date())
    for (student in class) {
      print(student)
    }
}
attendence_sheet(students) 

reset_combo <- function (class) {
  for(student in class) {
    combo <- sample(1:33,3)  
    print(student)
    print(combo)
  }
}

reset_combo(students)

for(student in students) {
  second_letter <- substr(student, 2,2)
  if(second_letter == 'e') {
    print(student)
    combo <- sample(34:66,3) 
    print(combo)
  }
}

###############################

all_schools <- read.csv(xxx.csv)

length(unique(all_schools[,"school_name"]))

paste("There are", length(school_count), "schools")


student_count <- nrow(students)
paste("There are a total of", length(school_count), "schools")

mean_redaing_score ,- summarize(students, mean(reading_score))
paste("There are a total of", length(school_count), "schools")

passing_reading <- filter(students, redaing_score>70)
passing_read_count <- nrow(passing_reading)
percentage_passing_reading <- passing_read_count*100 / student_count
percentage_passing_reading <- round(percentage_passing_reading)