
#' persons_65_p 
#' @description 
#' Plot population points of Americans over the age of 65 by year and projections
#' to 2060. 
#' @import ggplot2 
#' @return
#' @export
#'
#' 
persons_65_plot <- function() {
  ggplot(person_65_p) +
    aes(x = Year, y = population) +
    geom_step(size = 0.5, colour = "#f9a21a"
    ) +
    geom_vline(xintercept = 2019, col="purple", linetype= "dashed", size =1) +
    labs(
      title = "Number of Persons 65 & Over 1900-2060",
      subtitle = "Number in Millions",
      caption = "Source: U.S. Census Bureau,
 Population Estimates and Projections"
    ) +
    
    geom_text(aes(x = 2040, y = 90,
                      label = "Projected increase \n after 2018"),
                  angle = 25)+
    urbnthemes::theme_urbn_print(base_size = 8.5, base_family = "Lato",
                     base_line_size = 0.5, base_rect_size = 0.5)
  
  
}



#' number_state_map
#' @description 
#' Uses the state profile data set to display population date of persons over 
#' the age of 65 on US Map. 
#' @return a map
#' @export
#'
#' 
number_state_map <- function(){
  plot_usmap(data = state_profile, values = "Number of Persons 65 and Older", labels = FALSE) +
    scale_fill_continuous( low = "white", high = "purple", 
                           name = "Population", label = scales::label_number_si()) + 
     theme(legend.position = "right") + 
    theme(panel.background = element_rect(colour = "black")) + 
    labs(title = "Population of People 65 and Over by State", caption = "Source: @kgilds") 
  
  
}

#' state65plus_m
#' @description 
#' Uses the state profile data set to display population date of persons over 
#' the age of 65 on US Map. 
#' @import ggplot2
#' @return 
#' @export

state65plus_m <- function(df){
  
  urbnthemes::set_urbn_defaults(style = "map")
  
  df %>%
  ggplot() +
    geom_sf(
            mapping = aes(fill = population65plus, label = state_name),
            color = "#ffffff", size = 0.25)  +
    scale_fill_continuous( low = "grey", high = "purple", 
                           name = "Population 65 Plus", label = scales::label_number_si()) +
    theme(panel.background = element_rect(colour = "black"))
  
  
}