#' states UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#' @import dplyr 
#' @importFrom shiny NS tagList 
mod_states_ui <- function(id){
  ns <- NS(id)
  #tagList(
  bs4Dash::bs4TabItem(
    tabName = "states_ui_1",
    
    fluidRow(
      bs4Dash::bs4Card(
        title = "State Data",
        width = 12,
        status = "purple",
        maximizable = TRUE,
        overflow = TRUE,
        h1("Population 65 & older by State"),
        plotly::plotlyOutput(ns("state_pop_m")),
        h1("Percent Increase from 2008-2018"),
        plotly::plotlyOutput(ns("state_pop_increase"))
        
        
      )
    )
    
    
    
  )  
    
  
        
      
      
    
 
  #)
}
    
#' states Server Function
#'
#' @noRd 
mod_states_server <- function(input, output, session){
  ns <- session$ns
  

 
    
state_pop <- 
      state_profile %>%
      dplyr::rename(state_name = State,
                    population65plus = "Number of Persons 65 and Older",
                    percent_increase = "Percent Increase from 2008 to 2018",
                    below_poverty = "Percent Below Poverty 2018") 
    
    states_sf <- urbnmapr::get_urbn_map(map = "states", sf = TRUE) %>%
    dplyr::left_join(state_pop, by = "state_name")  
      
      
      
      states <- urbnmapr::get_urbn_map(map = "states", sf = TRUE) %>% 
        dplyr::left_join(state_pop, by = "state_name")
      
      
      
output$state_pop_m <- plotly::renderPlotly({
  
  urbnthemes::set_urbn_defaults(style = "map")
  
  
  ggplot() +
    geom_sf(states_sf,
            mapping = aes(fill = population65plus, label = state_name),
            color = "#ffffff", size = 0.25)  +
    scale_fill_continuous( low = "grey", high = "purple", 
                           name = "Population 65 Plus", label = scales::label_number_si()) +
    theme(panel.background = element_rect(colour = "black"))
  
  
})      




output$state_pop_increase <-plotly::renderPlotly({
  
  urbnthemes::set_urbn_defaults(style = "map")
  
  
  ggplot() +
    geom_sf(states_sf,
            mapping = aes(fill = percent_increase, label = state_name),
            color = "#ffffff", size = 0.25)  +
    scale_fill_continuous( low = "grey", high = "purple", 
                           name = "Percent increase from 2008-2018", label = scales::percent
    ) +  
    theme(panel.background = element_rect(colour = "black"))
  
  
})




      
  
  output$state_num <- shiny::renderPlot({
  
  number_state_map()
   
  
})
  
 
}
    
## To be copied in the UI
# mod_states_ui("states_ui_1")
    
## To be copied in the server
# callModule(mod_states_server, "states_ui_1")
 
