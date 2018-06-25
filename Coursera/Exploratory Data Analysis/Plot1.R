# *************************************************************
# Create and save plot 1
# *************************************************************

p1 = ggplot()+
        geom_histogram(aes(x = Global_active_power), data = elec_power, 
                       color = "black", fill = "red", binwidth = 0.5)+
        labs(title = "Global Active Power",
             x = "Global Active Power (kilowatts)",
             y = "Frequency")+
        theme_bw()
p1

# To get pixels, multiply height or width in inches by dpi
# e.g. 300 dpi x 1.6 in = 480 pixels
ggsave("Plot1.png", plot = p1, path = "Coursera/Exploratory Data Analysis",
       width = 4.8, height = 4.8, units = "in", dpi = 100)

