#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny 
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(
      
      #tags$link(rel ="stylesheet", type="text/css", href="inst/app/www/custom.css")
    ),
    # List the first level UI elements here 
    waiter::use_waiter(),
    waiter::waiter_on_busy(waiter::spin_heart(), color = "purple"),
    
    
    bs4Dash::bs4DashPage(
      
      enable_preloader = TRUE,
      
      navbar = bs4Dash::bs4DashNavbar(
        status = "purple"
        
        
      ),#navbar
      sidebar_collapsed = TRUE,
      sidebar = bs4Dash::bs4DashSidebar(
        skin = "light",
        status = "purple",
        title = "Profile of Older Americans",
      
      bs4Dash::bs4SidebarMenu(
        id = "current_tab",
        bs4Dash::bs4SidebarHeader("Menu"),
        
        bs4Dash::bs4SidebarMenuItem(
          "About",
          tabName = "about_ui_1",
          icon = "info"
        ),
        
        bs4Dash::bs4SidebarMenuItem(
          "Aging Population",
          tabName = "population_65_plus_ui_1",
          icon = "hourglass"
        ),
        bs4Dash::bs4SidebarMenuItem(
          "State Profile",
          tabName = "states_ui_1",
          icon = "globe"
        )
        
        
    )
      ),
    body = bs4Dash::bs4DashBody(
      bs4Dash::bs4TabItems(
        mod_about_ui("about_ui_1"),
        mod_population_65_plus_ui("population_65_plus_ui_1"),
        mod_states_ui("states_ui_1")
        
      )
      ),#body
    
    footer =  bs4Dash::bs4DashFooter(
      h5("Built with",
         img(src = "https://rstudio.com/wp-content/uploads/2014/04/shiny.png", height = "30px"),
         "by",
         img(src = "https://rstudio.com/wp-content/uploads/2014/07/RStudio-Logo-Blue-Gray.png", height = "30px")
      
      
    ),
    
    right_text = a(
      href = "https://kgilds.rbind.io/",
      target = '_blank', "Created by Kevin Gilds"
    )
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
    
    tags$link(rel="stylesheet", type="text/css", href="inst/app/www/style.css") 
    # for example, you can add shinyalert::useShinyalert() 
  )
}

