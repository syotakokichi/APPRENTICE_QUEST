{"filter":false,"title":"repeat.sh","tooltip":"/repeat.sh","undoManager":{"mark":6,"position":6,"stack":[[{"start":{"row":0,"column":0},"end":{"row":4,"column":22},"action":"insert","lines":["#!/bin/bash","","echo \"What's your name?\"","read name","echo \"Welcome, $name!\""],"id":1}],[{"start":{"row":2,"column":0},"end":{"row":4,"column":22},"action":"remove","lines":["echo \"What's your name?\"","read name","echo \"Welcome, $name!\""],"id":2}],[{"start":{"row":2,"column":0},"end":{"row":2,"column":1},"action":"insert","lines":["w"],"id":3},{"start":{"row":2,"column":1},"end":{"row":2,"column":2},"action":"insert","lines":["h"]},{"start":{"row":2,"column":2},"end":{"row":2,"column":3},"action":"insert","lines":["i"]}],[{"start":{"row":2,"column":0},"end":{"row":2,"column":3},"action":"remove","lines":["whi"],"id":4},{"start":{"row":2,"column":0},"end":{"row":2,"column":5},"action":"insert","lines":["while"]}],[{"start":{"row":2,"column":5},"end":{"row":2,"column":6},"action":"insert","lines":[" "],"id":5}],[{"start":{"row":0,"column":0},"end":{"row":2,"column":6},"action":"remove","lines":["#!/bin/bash","","while "],"id":6},{"start":{"row":0,"column":0},"end":{"row":9,"column":0},"action":"insert","lines":["#!/bin/bash","","i=1","while [ $i -le 100 ]; do","    if [ $((i % 2)) -eq 0 ]; then","        echo $i","    fi","    i=$((i + 1))","done",""]}],[{"start":{"row":8,"column":4},"end":{"row":9,"column":0},"action":"remove","lines":["",""],"id":7}],[{"start":{"row":7,"column":16},"end":{"row":8,"column":4},"action":"remove","lines":["","done"],"id":8}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":8,"column":4},"end":{"row":8,"column":4},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1682671412878,"hash":"fe7bb7a12c20d9fab199a4050afe2d0dbfef6b4b"}