Color_Off="\[\e[0m\]"       # Text Reset                                                                                               
BRed="\[\e[1;31m\]"         # Red                                                                                                      
BGreen="\[\e[1;32m\]"       # Green                                                                                                    
IRed="\[\e[0;91m\]"         # Red                                                                                                      
IGreen="\[\e[0;92m\]"       # Green                                                                                                    
ICyan="\[\e[0;96m\]"        # Cyan                                                                                                     
BYellow="\[\e[1;33m\]"      # Yellow                                                                                                   
BCyan="\[\e[1;36m\]"        # Cyan                                                                                                     
IOrange="\[\e[38;05;208m\]" # Orange                                                                                                   
                                                                                                                                       
if [ $(whoami) != 'root' ]; then                                                                                                       
  user_color=$IOrange                                                                                                                  
else                                                                                                                                   
  user_color=$BRed                                                                                                                     
fi                                                                                                                                     
                                                                                                                                       
function parse_git_branch {                                                                                                            
  if ! git rev-parse --git-dir > /dev/null 2>&1; then                                                                                  
    return 0                                                                                                                           
  fi                                                                                                                                   
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')                                                                        
  if git diff --quiet 2>/dev/null >&2; then                                                                                            
    git_color=$IGreen                                                                                                                  
  else                                                                                                                                 
    git_color=$IRed                                                                                                                    
  fi                                                                                                                                   
  echo -e "(git: $git_color$git_branch$Color_Off)"                                                                                     
}                                                                                                                                      
                                                                                                                                       
PROMPT_COMMAND='PS1="$user_color\u$Color_Off$BYellow::$Color_Off$BCyan$(pwd -P)$Color_Off $(parse_git_branch)\n~ \$ $Color_Off"'
export NVM_DIR="/Users/stanislav/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
