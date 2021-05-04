#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
   
    
    bs4Dash::bs4DashPage(
      
      enable_preloader = TRUE,
      
      navbar = bs4Dash::bs4DashNavbar(
        status = "warning",  
        "Profile of Older Americans"
        
      ),#navbar
      sidebar_collapsed = TRUE,
      sidebar = bs4Dash::bs4DashSidebar(
        skin = "light",
        status = "danger",
        title = "Profile of Older Americans",
      
      bs4Dash::bs4SidebarMenu(
        id = "current_tab",
        bs4Dash::bs4SidebarHeader("Menu"),
        bs4Dash::bs4SidebarMenuItem(
          "Home",
          tabName = "population_65_plus_ui_1",
          icon = "sliders"
        ),
        bs4Dash::bs4SidebarMenuItem(
          "State Profile",
          tabName = "states_ui_1"
        )
    )
      ),
    body = bs4Dash::bs4DashBody(
      bs4Dash::bs4TabItems(
        mod_population_65_plus_ui("population_65_plus_ui_1"),
        mod_states_ui("states_ui_1")
      )),#body
    footer =  bs4DashFooter(
      copyrights = a(
        href = "https://kgilds.rbind.io/",
        target = '_blank', "Developed by Kevin Gilds"
      ),
      
      right_text = Sys.Date(),
      center_text = ""
      
      
    )
    
    ) #page
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'ACLOlderAmericansProfile'
    ),
    # Add here other external resources
    tags$link(rel="stylesheet", type="text/css", href="inst/app/www/custom.css")
    # for example, you can add shinyalert::useShinyalert() 
  )
}

