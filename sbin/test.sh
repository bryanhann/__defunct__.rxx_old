if [ ! "${1}" == .recur. ]; then
    ../rxx $0 .recur. 
    exit $?
fi

rm -rf ${RXX_VENV}
rm -rf ${RXX_REPO}

rxx  .dinstall r20.git  foo  ./rxx_test/durian/cherry/banana/apple  AAA
rxx  .dinstall r20.git  bar  ./rxx_test/durian/cherry/banana        BBB
rxx  .dinstall r20.git  foo  ./rxx_test/durian                      DDD

rxx -q

python3 -m AAA.exitwith 56

if [ $? == 56 ]; 
    then echo [pass] AAA.exitwith; 
    else echo [fail] AAA.exitwith;  
fi

python3 -m BBB.apple.exitwith 57

if [ $? == 57 ]; 
    then echo [pass] BBB.apple.exitwith; 
    else echo [fail] BBB.apple.exitwith;  
fi

python3 -m DDD.cherry.banana.apple.exitwith 58

if [ $? == 58 ]; 
    then echo [pass] DDD.cherry.banana.apple.exitwith; 
    else echo [fail] DDD.cherry.banana.apple.exitwith;  
fi
