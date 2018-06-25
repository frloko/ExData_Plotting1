# *************************************************************
# Create and save plot 4
# *************************************************************

p4 = ggplot()+
        geom_line(aes(x = DateTime, y = Voltage), 
                  data = elec_power_long)+
        labs(x = "datetime", y = "Voltage")+
        # scale_x_date(date_labels = "%a")+
        theme_bw()
p4

p5 = ggplot()+
        geom_line(aes(x = DateTime, y = Global_reactive_power), 
                  data = elec_power_long)+
        labs(x = "datetime", y = "Global_reactive_power")+
        # scale_x_date(date_labels = "%a")+
        theme_bw()
p5


p6 = multiplot(p2,p3,p4,p5,cols=2)
