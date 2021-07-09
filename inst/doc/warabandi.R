## ----setup--------------------------------------------------------------------
library(warabandi)

## -----------------------------------------------------------------------------
head(warabandi_data)


## -----------------------------------------------------------------------------
output<-warabandi(file = warabandi_data, output = FALSE, nof = "my_file.csv")

## -----------------------------------------------------------------------------
output[1:5]
Report_Table<-data.frame(output[6])
head(Report_Table)

## -----------------------------------------------------------------------------
data2<-Report_Table

## -----------------------------------------------------------------------------
flextable::flextable(head(data2))

## -----------------------------------------------------------------------------
data3 <- data.frame(head(data2))
invisible(by(data3, seq_len(nrow((data3))), function(row) {
  chak<-"Chak-38 R.B" 
distributries<- "R.B II"
dateOI<-date()
dateOd<-"Date of distribution __/__/____"
note1<-"Note: All schedules issued before this, are cancelled"
Year_o_Valid<-"Year: April 2019 to 2025"
Issue<-"Issue Serial No:________/___"
Jal_upbhokta<-"Jal Upbhokta Sangam:"
d5 <-flextable::fit_to_width(flextable::flextable(row), max_width = 7,
                             inc=1L, max_iter = 20)
d5 <- flextable::add_header_lines(d5, c(paste(Year_o_Valid,"\t","\t", chak), paste(Jal_upbhokta,
                                                                                   distributries, "\t","\t", Issue, "\t","\t","\t","\t",  dateOI)))
d5 <-flextable::add_footer_lines(d5, 
                                 c(paste(dateOd, "\t", "\t", note1), 
                                   paste("President", "\n", "\n", "\n", 
                                         Jal_upbhokta, distributries)))
 #flextable::flextable_to_rmd(d5)

 }))

