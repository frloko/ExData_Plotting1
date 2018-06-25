# *************************************************************
# Create and save plot 3
# *************************************************************

elec_power_long = elec_power %>% 
        gather(key = "sub_metering_id", value = "sub_metering_value", Sub_metering_1:Sub_metering_3)

p3 = ggplot()+
        geom_line(aes(x = DateTime, y = sub_metering_value, color = sub_metering_id), 
                  data = elec_power_long)+
        labs(x = "", y = "Energy sub metering")+
        # scale_x_date(date_labels = "%a")+
        theme_bw()
p3

ggsave("Plot3.png", plot = p3, path = "Coursera/Exploratory Data Analysis",
       width = 6.4, height = 6.4, units = "in", dpi = 75)

