# put this file in C:\Users\User

options(blogdown.ext = ".Rmd", blogdown.author = "Martin Monkman")


.First <- function() {
  # set library path
  .libPaths("C:/RPackages")
  # load packages
  # library(ggplot2)
  # library(Lahman)
  # msg upon completion
  cat(
    "\n>> Your .Rprofile was successfully loaded at", date(), "<<", "\n",
    #
    "\n>> with package library a C:/RPackages", "<<", "\n", "\n",
    
    sample(x = (c(
        # inspiro.bot
                    "INNOVATION: IT BEGINS WITH YOU",
                    "CARE ABOUT COMMON SENSE",
                    "DON'T FORGET TO KEEP ON GOING",
                    "MAKE THE MOST OF YOUR ATTITUDE",
                    "THINK. IT'S NEVER TOO LATE",
        # Yogi Berra
        '"YOU CAN OBSERVE A LOT BY WATCHING." - Yogi Berra',
        '"THE FUTURE AIN\'T WHAT IT USED TO BE." - Yogi Berra',
        '"WHEN YOU COME TO A FORK IN THE ROAD, TAKE IT." - Yogi Berra',
        # real inspiration
                    "DON'T PANIC",
                    "GENERIC MOTIVATIONAL QUOTE!"
      )
      ),
      size = 1
      ),
      "\n",
    #
    # countdown
    #"\n - It's only ", difftime(as.POSIXct("2023-12-22 03:27", tz="UTC"), Sys.time(), units = "days")[[1]],
    #" days to the 2023 winter solstice", "\n"
    #"\n - It's only ", difftime(as.POSIXct("2024-03-20 03:06", tz="UTC"), Sys.time(), units = "days")[[1]],
    #" days to the 2024 spring equinox", "\n"
    "\n Fun fact - It's only ", difftime(as.POSIXct("2026-08-12 17:47:06", tz="UTC"), Sys.time(), units = "days")[[1]],
    " days to the next total solar eclipse", "\n"
    #"\n - It's only ", difftime(as.POSIXct("2025-03-13 11:58", tz="UTC"), Sys.time(), units = "days")[[1]],
    #" days to the total lunar eclipse!", "\n"
    
  )
}


## .Last() run at the end of the session

.Last <- function() {
  # save command history here?
  cat("\nGoodbye at ", date(),
      "\n")
}
#

options(help_type="html")
