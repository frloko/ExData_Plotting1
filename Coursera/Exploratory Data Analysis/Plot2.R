# *************************************************************
# Create and save plot 2
# *************************************************************

elec_power = elec_power %>% mutate(DateTime = as.POSIXct(paste(Date, Time)))

p2 = ggplot()+
        geom_line(aes(x = DateTime, y = Global_active_power), data = elec_power, 
                  color = "black")+
        labs(x = "", y = "Global Active Power (kilowatts)")+
        # scale_x_date(date_labels = "%a")+
        theme_bw()
p2

ggsave("Plot2.png", plot = p2, path = "Coursera/Exploratory Data Analysis",
       width = 4.8, height = 4.8, units = "in", dpi = 100)

