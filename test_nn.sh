#!/bin/bash

echo "Test 1"
leo run -q compute "{ in1: -181267i128, in2: 336834i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 2"
leo run -q compute "{ in1: 4443i128, in2: 966478i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 3"
leo run -q compute "{ in1: -342958i128, in2: -151764i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 4"
leo run -q compute "{ in1: -293178i128, in2: 962480i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 5"
leo run -q compute "{ in1: 192460i128, in2: -394641i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 6"
leo run -q compute "{ in1: 321429i128, in2: -305944i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 7"
leo run -q compute "{ in1: 850645i128, in2: 552831i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 8"
leo run -q compute "{ in1: 999847i128, in2: 189800i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 9"
leo run -q compute "{ in1: -367555i128, in2: -173140i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 10"
leo run -q compute "{ in1: 55282i128, in2: 977907i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 11"
leo run -q compute "{ in1: -481136i128, in2: 796966i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 12"
leo run -q compute "{ in1: -91968i128, in2: 352019i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 13"
leo run -q compute "{ in1: 966399i128, in2: 359227i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 14"
leo run -q compute "{ in1: -281583i128, in2: -308476i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 15"
leo run -q compute "{ in1: -919316i128, in2: -252760i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 16"
leo run -q compute "{ in1: 374433i128, in2: -47643i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 17"
leo run -q compute "{ in1: 197512i128, in2: 332326i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 18"
leo run -q compute "{ in1: -686810i128, in2: 713735i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 19"
leo run -q compute "{ in1: -284807i128, in2: 267009i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 20"
leo run -q compute "{ in1: -841971i128, in2: 465137i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 21"
leo run -q compute "{ in1: 8279i128, in2: 989227i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 22"
leo run -q compute "{ in1: 1005008i128, in2: -212258i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 23"
leo run -q compute "{ in1: -331449i128, in2: 214292i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 24"
leo run -q compute "{ in1: -841805i128, in2: 607126i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 25"
leo run -q compute "{ in1: 644762i128, in2: 743086i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 26"
leo run -q compute "{ in1: 899288i128, in2: 366547i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 27"
leo run -q compute "{ in1: -245009i128, in2: -962478i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 28"
leo run -q compute "{ in1: 860271i128, in2: -518446i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 29"
leo run -q compute "{ in1: -988762i128, in2: -240288i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 30"
leo run -q compute "{ in1: -206211i128, in2: -297599i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 31"
leo run -q compute "{ in1: 302932i128, in2: 238234i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 32"
leo run -q compute "{ in1: 591095i128, in2: 803354i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 33"
leo run -q compute "{ in1: -402363i128, in2: 865038i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 34"
leo run -q compute "{ in1: 40283i128, in2: -407915i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 35"
leo run -q compute "{ in1: -504267i128, in2: 851776i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 36"
leo run -q compute "{ in1: 61945i128, in2: 389726i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 37"
leo run -q compute "{ in1: -133510i128, in2: 437193i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 38"
leo run -q compute "{ in1: -328679i128, in2: -245549i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 39"
leo run -q compute "{ in1: -34611i128, in2: -416385i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 40"
leo run -q compute "{ in1: -257841i128, in2: -304329i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 41"
leo run -q compute "{ in1: -359800i128, in2: 207066i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 42"
leo run -q compute "{ in1: -402526i128, in2: -65045i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 43"
leo run -q compute "{ in1: 188306i128, in2: 315791i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 44"
leo run -q compute "{ in1: 424563i128, in2: -887778i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 45"
leo run -q compute "{ in1: -400453i128, in2: 914752i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 46"
leo run -q compute "{ in1: 85719i128, in2: 400918i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 47"
leo run -q compute "{ in1: 568556i128, in2: -770839i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 48"
leo run -q compute "{ in1: -14422i128, in2: 1022163i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 49"
leo run -q compute "{ in1: 6690i128, in2: 348149i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 50"
leo run -q compute "{ in1: 280876i128, in2: -326192i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 51"
leo run -q compute "{ in1: -311174i128, in2: 944597i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 52"
leo run -q compute "{ in1: -390345i128, in2: 941992i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 53"
leo run -q compute "{ in1: 898346i128, in2: -394937i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 54"
leo run -q compute "{ in1: 286990i128, in2: -941758i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 55"
leo run -q compute "{ in1: 365011i128, in2: 143223i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 56"
leo run -q compute "{ in1: -321764i128, in2: -909114i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 57"
leo run -q compute "{ in1: 401513i128, in2: 88386i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 58"
leo run -q compute "{ in1: -343326i128, in2: -268442i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 59"
leo run -q compute "{ in1: -413850i128, in2: 80826i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 60"
leo run -q compute "{ in1: -991448i128, in2: 139636i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 61"
leo run -q compute "{ in1: 241868i128, in2: -332681i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 62"
leo run -q compute "{ in1: 933092i128, in2: 297936i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 63"
leo run -q compute "{ in1: -951828i128, in2: 160820i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 64"
leo run -q compute "{ in1: -257683i128, in2: -320984i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 65"
leo run -q compute "{ in1: -154471i128, in2: 356415i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 66"
leo run -q compute "{ in1: -28061i128, in2: 405897i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 67"
leo run -q compute "{ in1: 392122i128, in2: -65502i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 68"
leo run -q compute "{ in1: 988178i128, in2: -53517i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 69"
leo run -q compute "{ in1: 206659i128, in2: 956319i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 70"
leo run -q compute "{ in1: 940917i128, in2: -157621i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 71"
leo run -q compute "{ in1: 352570i128, in2: -205462i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 72"
leo run -q compute "{ in1: 295823i128, in2: 970343i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 73"
leo run -q compute "{ in1: -1002715i128, in2: 39226i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 74"
leo run -q compute "{ in1: -381519i128, in2: -65233i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 75"
leo run -q compute "{ in1: 426141i128, in2: 19275i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 76"
leo run -q compute "{ in1: 332122i128, in2: -199235i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 77"
leo run -q compute "{ in1: -33730i128, in2: -364001i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 78"
leo run -q compute "{ in1: 743769i128, in2: 646839i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 79"
leo run -q compute "{ in1: -581462i128, in2: 807431i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 80"
leo run -q compute "{ in1: 289245i128, in2: 344664i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 81"
leo run -q compute "{ in1: -852944i128, in2: 484932i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 82"
leo run -q compute "{ in1: -158523i128, in2: 324373i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 83"
leo run -q compute "{ in1: 941088i128, in2: 186300i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 84"
leo run -q compute "{ in1: -54190i128, in2: -399184i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 85"
leo run -q compute "{ in1: -409041i128, in2: 122957i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 86"
leo run -q compute "{ in1: 190315i128, in2: 380451i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 87"
leo run -q compute "{ in1: 672726i128, in2: -761079i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 88"
leo run -q compute "{ in1: -574909i128, in2: -791126i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 89"
leo run -q compute "{ in1: 132134i128, in2: -971560i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 90"
leo run -q compute "{ in1: 1011023i128, in2: -194904i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 91"
leo run -q compute "{ in1: -408712i128, in2: -199850i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 92"
leo run -q compute "{ in1: 10265i128, in2: -385426i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 93"
leo run -q compute "{ in1: -44572i128, in2: -327246i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 94"
leo run -q compute "{ in1: 149966i128, in2: -378175i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 95"
leo run -q compute "{ in1: -331500i128, in2: -281734i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 96"
leo run -q compute "{ in1: -677929i128, in2: 763232i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 97"
leo run -q compute "{ in1: 54594i128, in2: 354398i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 98"
leo run -q compute "{ in1: -431927i128, in2: -12556i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 99"
leo run -q compute "{ in1: -899622i128, in2: 497820i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 100"
leo run -q compute "{ in1: 80517i128, in2: -399861i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 101"
leo run -q compute "{ in1: 42558i128, in2: 1029245i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 102"
leo run -q compute "{ in1: -984180i128, in2: -327878i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 103"
leo run -q compute "{ in1: 165543i128, in2: 368111i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 104"
leo run -q compute "{ in1: 398010i128, in2: 92428i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 105"
leo run -q compute "{ in1: -930273i128, in2: 304480i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 106"
leo run -q compute "{ in1: 18094i128, in2: -970994i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 107"
leo run -q compute "{ in1: -78485i128, in2: -390369i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 108"
leo run -q compute "{ in1: 765770i128, in2: 665598i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 109"
leo run -q compute "{ in1: -668440i128, in2: -682017i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 110"
leo run -q compute "{ in1: 346124i128, in2: -92909i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 111"
leo run -q compute "{ in1: 19130i128, in2: 373351i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 112"
leo run -q compute "{ in1: -256776i128, in2: 303201i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 113"
leo run -q compute "{ in1: 424139i128, in2: 903133i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 114"
leo run -q compute "{ in1: 294383i128, in2: -299256i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 115"
leo run -q compute "{ in1: 453755i128, in2: 6754i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 116"
leo run -q compute "{ in1: -244799i128, in2: -934766i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 117"
leo run -q compute "{ in1: -192499i128, in2: -347785i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 118"
leo run -q compute "{ in1: -773517i128, in2: -657036i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 119"
leo run -q compute "{ in1: -122863i128, in2: -389240i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 120"
leo run -q compute "{ in1: -130393i128, in2: -993221i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 121"
leo run -q compute "{ in1: -372748i128, in2: 163046i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 122"
leo run -q compute "{ in1: -83355i128, in2: -966006i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 123"
leo run -q compute "{ in1: 880451i128, in2: -426968i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 124"
leo run -q compute "{ in1: -441032i128, in2: 100954i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 125"
leo run -q compute "{ in1: 431662i128, in2: -181769i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 126"
leo run -q compute "{ in1: -350669i128, in2: -953480i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 127"
leo run -q compute "{ in1: -332432i128, in2: -176015i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 128"
leo run -q compute "{ in1: 226715i128, in2: 322670i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 129"
leo run -q compute "{ in1: -126144i128, in2: 943683i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 130"
leo run -q compute "{ in1: 313120i128, in2: 249583i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 131"
leo run -q compute "{ in1: -438613i128, in2: 54621i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 132"
leo run -q compute "{ in1: 840822i128, in2: 523738i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 133"
leo run -q compute "{ in1: -4778i128, in2: -400692i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 134"
leo run -q compute "{ in1: 242795i128, in2: 948710i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 135"
leo run -q compute "{ in1: 373605i128, in2: 922076i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 136"
leo run -q compute "{ in1: 909799i128, in2: 364011i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 137"
leo run -q compute "{ in1: 95969i128, in2: -396239i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 138"
leo run -q compute "{ in1: -499587i128, in2: -878335i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 139"
leo run -q compute "{ in1: -944543i128, in2: 197432i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 140"
leo run -q compute "{ in1: 182824i128, in2: 335599i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 141"
leo run -q compute "{ in1: -831041i128, in2: -580908i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 142"
leo run -q compute "{ in1: 587281i128, in2: 828014i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 143"
leo run -q compute "{ in1: -791065i128, in2: 604149i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 144"
leo run -q compute "{ in1: -333011i128, in2: -172665i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 145"
leo run -q compute "{ in1: -869238i128, in2: -542824i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 146"
leo run -q compute "{ in1: 158954i128, in2: -942026i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 147"
leo run -q compute "{ in1: 371561i128, in2: 177261i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 148"
leo run -q compute "{ in1: -801488i128, in2: -597013i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 149"
leo run -q compute "{ in1: 215125i128, in2: 341398i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 150"
leo run -q compute "{ in1: -250084i128, in2: 956643i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 151"
leo run -q compute "{ in1: 374729i128, in2: -174519i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 152"
leo run -q compute "{ in1: 707946i128, in2: 684340i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 153"
leo run -q compute "{ in1: -398388i128, in2: -54827i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 154"
leo run -q compute "{ in1: -946849i128, in2: -240173i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 155"
leo run -q compute "{ in1: 380515i128, in2: -61908i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 156"
leo run -q compute "{ in1: 139644i128, in2: 342184i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 157"
leo run -q compute "{ in1: 260088i128, in2: 308179i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 158"
leo run -q compute "{ in1: -830933i128, in2: -547113i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 159"
leo run -q compute "{ in1: -773280i128, in2: -574072i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 160"
leo run -q compute "{ in1: -454456i128, in2: -66927i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 161"
leo run -q compute "{ in1: -339927i128, in2: 924667i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 162"
leo run -q compute "{ in1: 379388i128, in2: -42004i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 163"
leo run -q compute "{ in1: -208178i128, in2: -380182i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 164"
leo run -q compute "{ in1: -695490i128, in2: 634915i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 165"
leo run -q compute "{ in1: 182752i128, in2: 380588i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 166"
leo run -q compute "{ in1: 505672i128, in2: -805716i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 167"
leo run -q compute "{ in1: 957315i128, in2: 80263i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 168"
leo run -q compute "{ in1: -737271i128, in2: -589676i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 169"
leo run -q compute "{ in1: 746188i128, in2: -598009i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 170"
leo run -q compute "{ in1: 147189i128, in2: 383858i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 171"
leo run -q compute "{ in1: 216210i128, in2: 368407i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 172"
leo run -q compute "{ in1: 156373i128, in2: 400903i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 173"
leo run -q compute "{ in1: 387987i128, in2: 151172i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 174"
leo run -q compute "{ in1: 857803i128, in2: -379055i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 175"
leo run -q compute "{ in1: 868670i128, in2: 518042i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 176"
leo run -q compute "{ in1: 795830i128, in2: -578743i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 177"
leo run -q compute "{ in1: 229159i128, in2: -952642i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 178"
leo run -q compute "{ in1: 959129i128, in2: 55981i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 179"
leo run -q compute "{ in1: 197657i128, in2: 350627i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 180"
leo run -q compute "{ in1: 306151i128, in2: -975891i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 181"
leo run -q compute "{ in1: 550506i128, in2: -797310i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 182"
leo run -q compute "{ in1: -401149i128, in2: -28667i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 183"
leo run -q compute "{ in1: 582016i128, in2: 826817i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 184"
leo run -q compute "{ in1: -233108i128, in2: -347019i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 185"
leo run -q compute "{ in1: -403536i128, in2: 137955i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 186"
leo run -q compute "{ in1: -929980i128, in2: 399506i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 187"
leo run -q compute "{ in1: -100094i128, in2: 1012894i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 188"
leo run -q compute "{ in1: 911969i128, in2: 322399i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 189"
leo run -q compute "{ in1: -61711i128, in2: 378633i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 190"
leo run -q compute "{ in1: 203245i128, in2: -359836i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 191"
leo run -q compute "{ in1: -1000760i128, in2: 72362i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 192"
leo run -q compute "{ in1: -328658i128, in2: -192217i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 193"
leo run -q compute "{ in1: 211913i128, in2: 370847i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 194"
leo run -q compute "{ in1: 580638i128, in2: 822021i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 195"
leo run -q compute "{ in1: -231233i128, in2: -346617i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 196"
leo run -q compute "{ in1: 771740i128, in2: 596903i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 197"
leo run -q compute "{ in1: -369507i128, in2: 118307i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 198"
leo run -q compute "{ in1: 964070i128, in2: -70693i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 0u8
"

echo "Test 199"
leo run -q compute "{ in1: -324710i128, in2: 227571i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"

echo "Test 200"
leo run -q compute "{ in1: 133102i128, in2: 403879i128 }" | awk -F"• " '/u8/ {print "Actual Value   : "$2}'
echo "Expected Value : 1u8
"
