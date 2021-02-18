*** Settings ***
Library           RPA.Desktop
Library           RPA.Images

*** Keywords ***
Open Paint
    Open Application    mspaint.exe

*** Keywords ***
Write on canvas
    #Wait For Element  
    # screenshot
    # Find template on screen     capture1.bmp
    RPA.Desktop.Take Screenshot
    #Find Element      Image:ArtButton.bmp
    Move Mouse        image:capture1.bmp
    #Click             # Insert UI locator alias
    #Move Mouse        # Insert UI locator alias
    Click             offset:0,400



    Type Text         Paint
    Type Text         space
    Type Text         >
    Type Text         space
    Type Text         insert-your-favorite-image-editing-software-here

*** Tasks ***
Do a paint operation
    Open Paint
    Write on canvas