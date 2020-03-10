pushd ${RXX_ROOT} >  /dev/null

echo
echo usage:
echo "    ${RXX_ROOT}/rxx [OPTIONS] [<INTERNAL> [args ...]"
cat <<__HERE__

Run commands in a virtual environment.

KEYS:
    ROOT --> \$RXX_ROOT -- the root directory
    VENV --> \$RXX_VENV -- the location of the the python3 virtual environment. (activated on every call)
    REPO --> \$RXX_REPO -- the directory to which repos are cloned
    CONF --> \$RXX_CONF -- the configuration file directory
    ORIG --> \$RXX_ORIG -- the original host from which to clone  
    SITE --> \${RXX_VENV}/lib/.../site-packages

OPTIONS:
    -v          verbose (persists between calls.)
    -q          quiet (persists between calls.)
    -c <name>   load a file from CONF

INTERNAL:
    .pip                              --> pip (like ordinary pip, but explicitely uses a cache directory)
    .link <path> <name2>              --> ln -s REPO/<path> SITE/<name2>
    .clone  url   name2               --> git clone url         REPO/name2
    .dclone name1 name2               --> git clone ORIG/name1  REPO/<name2>
    .install  url   name2 path name3  --> .clone  url   name2 ; .link  name2/path name3
    .dinstall name1 name2 path name3  --> .dclone name1 name2 ; .link  name2/path name3

EXAMPLE:
    rxx .dinstall foo bar ./some/internal/path fruit

    This will 
        1) git clone ORIG/foo REPO/bar    
        2) ln -s REPO/bar/./some/internal/path  SITE/fruit
    allowing
        3) python -c "import fruit"

NOTES:
    Internally this program uses .dclone to clone repos from an original location pointed to by \${RXX_ORIG}. 
    This is assumed to be the same place from which which this rxx program was cloned. Hence by default this
    will be set according to the output of 'git remote -v'.

    Alternatively, the caller can predefine \${RXX_ORIG}, in which case the program will use this value instead.

    The result of 'git remote -v' for this installation follows.

__HERE__

git remote -v

popd > /dev/null

if [ -z ${RXX_ORIG} ]; then 
    echo **
    echo ** FATAL: \$RXX_ORIG undefined
    echo **
fi

exit 0
