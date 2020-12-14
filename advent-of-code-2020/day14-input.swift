//
//  day14-input.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/14/20.
//

import Foundation

let input_day14_0 = """
mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
mem[8] = 11
mem[7] = 101
mem[8] = 0
"""

let input_day14_1 = """
mask = 000000000000000000000000000000X1001X
mem[42] = 100
mask = 00000000000000000000000000000000X0XX
mem[26] = 1
"""

let input_day14 = """
mask = X011X00011011110001X01010011X0X0X010
mem[35176] = 9976167
mem[39031] = 108553
mem[59131] = 6439623
mem[63499] = 293387351
mem[53936] = 331755
mem[56389] = 2017477
mask = 101110001111X1X0000011X11X1X01X00001
mem[115] = 642
mem[35236] = 21608171
mem[40102] = 7571
mask = 0010100X10X01X00010XX0001X1X0X011001
mem[45336] = 5952410
mem[22732] = 97085
mem[13568] = 32642580
mem[11278] = 991213086
mem[13552] = 1655255
mask = 01X0101XX110110101010X1001X0010110X1
mem[42192] = 4234239
mem[31473] = 17136584
mem[29723] = 93520
mem[29158] = 116136736
mask = 0001100X0X1X110X1X00010X0100010X0100
mem[39435] = 357608510
mem[14973] = 532464795
mem[2752] = 64188
mem[61697] = 11187418
mem[18575] = 199186
mem[47723] = 426934
mem[27423] = 1974772
mask = 000110000010X10X0X001100X01001X0X1X0
mem[44107] = 25101
mem[44194] = 21551
mem[12030] = 169
mem[6630] = 12436270
mask = 0X11XX0111111111110010101110100XX000
mem[449] = 7072331
mem[42523] = 267359150
mem[19455] = 24135
mem[39633] = 268298
mask = 0001100101111X01X0X01101X1001001X000
mem[4608] = 14005
mem[10241] = 782600
mem[54738] = 209648820
mask = 101X100011100X00X10111010X00010X01X0
mem[42500] = 58188815
mem[11694] = 11887
mem[39816] = 128889468
mem[37274] = 5127
mem[17385] = 17378063
mask = 0111110X0X0011X1010X1X110101X1XX0001
mem[6801] = 243108
mem[48960] = 4760103
mem[22732] = 523377
mask = 00011000001X1X1010000X01110X00X0X001
mem[4608] = 1170
mem[30523] = 52724553
mem[64163] = 19673
mem[11679] = 12049
mem[338] = 18404
mem[36800] = 1073142
mask = XX101000101010000101001000100X1100X0
mem[25041] = 33614936
mem[19637] = 12910
mem[48777] = 312026612
mem[3614] = 42590
mask = 00X0000000X0110001001X11X10001000001
mem[13162] = 62756298
mem[14130] = 79824
mask = 10X100X01X1X1X10000X0X000111X10X0101
mem[54039] = 155170303
mem[47391] = 11186
mem[16757] = 64889909
mem[19198] = 34026906
mask = 00011X0X01XX1101X000X10110XX0000000X
mem[14232] = 18518
mem[4532] = 1320230
mem[40264] = 68063
mem[29145] = 147910
mask = 011X1X0X011011000000110X0110101X0X00
mem[13568] = 975118
mem[2216] = 425464
mem[59072] = 777680332
mask = 0X0010X0X110110X010X111XX100X0001000
mem[8637] = 3036011
mem[11345] = 28691019
mem[28520] = 801207
mem[63730] = 666
mask = 0001110010XX11X1000000010110X0100001
mem[4651] = 9924
mem[61289] = 2749110
mem[57251] = 19712904
mask = X0X1101001100X10X10X11001X0101011010
mem[24158] = 8884236
mem[22515] = 1409
mem[22964] = 183923110
mem[33878] = 885936
mem[44538] = 874947
mem[5990] = 363
mask = 0X11X101011XX111011010X1X0X01101X001
mem[27091] = 1044
mem[57617] = 3722045
mask = 0XX11X101110010X010X101XX0X111010X11
mem[26059] = 13841479
mem[55461] = 4252699
mem[56882] = 25286
mem[55972] = 1008168
mem[60550] = 1965604
mem[43412] = 861720
mask = 1X11000XX1011X100010101X0XX10X1011X0
mem[54042] = 883549632
mem[65377] = 94416
mem[33534] = 13467
mask = 00111000011111110X01X1XX100101011X11
mem[21993] = 74
mem[49628] = 5558
mem[61750] = 475383817
mem[36392] = 32630
mask = 111X10001X1X01001X0110X0001010010100
mem[52078] = 214690759
mem[62049] = 235777
mem[55972] = 162504
mem[28257] = 1771
mem[49729] = 23532
mem[3769] = 475930259
mem[50832] = 7539691
mask = 01011X01010011111X00111111X111000X01
mem[47391] = 294107389
mem[41571] = 33636200
mem[34344] = 4779864
mem[5210] = 14455055
mem[55569] = 294086
mem[14810] = 19093
mask = 011110101110X10X01XX11110X1100110010
mem[43678] = 103962743
mem[46649] = 174
mem[17417] = 51516531
mem[44279] = 13699
mem[29723] = 382196268
mask = 0X1X10X0X11011000X00111100X1001X0X00
mem[58181] = 7631
mem[54660] = 18
mem[62624] = 65676864
mem[7637] = 682188755
mem[30523] = 54181
mask = X001100001X00101X000010101011010100X
mem[62308] = 3258008
mem[54316] = 546
mem[35020] = 84582
mem[63858] = 243188165
mem[20003] = 1739942
mask = 0XX01X10X1101100X1X010111X0110XX0001
mem[62495] = 31369385
mem[30172] = 50943552
mem[43610] = 56640
mem[25863] = 5589
mask = XX1X100001100100000100X1110010111000
mem[15271] = 1383
mem[30514] = 517505
mem[53271] = 1003887
mem[30597] = 198292
mem[60624] = 498352568
mem[41024] = 5218437
mask = 001XX00001110100X0011100X0000000011X
mem[21892] = 29032569
mem[48960] = 7348953
mem[34838] = 5416170
mem[54039] = 3631
mem[3062] = 651155
mask = 101100001X11X11X000X010X11010X000110
mem[45244] = 490449
mem[2123] = 368294
mem[45758] = 1822
mem[40631] = 245598209
mem[36989] = 3830384
mem[6227] = 5405426
mem[6315] = 11116
mask = X0011000X0X01101100XXX11111001100001
mem[51307] = 11819100
mem[10561] = 605909523
mem[27387] = 31698
mem[25513] = 458925821
mem[37018] = 522164
mem[18187] = 13328
mask = 0X0X10X00110X1000X000X1X1100000100X0
mem[64601] = 63
mem[1569] = 42324
mem[11413] = 640
mask = 00X110000X1011XXX000000X11000000XX01
mem[7713] = 14341
mem[11413] = 4062857
mem[60014] = 2945180
mask = 011X1010111011000X00X111X0110110000X
mem[7637] = 7272948
mem[53569] = 499905
mem[16193] = 26937
mem[26059] = 54033
mask = 0XXX1100X01XX101010001001010XX001111
mem[45815] = 2006054
mem[39698] = 7265
mem[45186] = 596544
mem[32965] = 2713
mem[28434] = 980517
mem[45787] = 558823
mem[61407] = 448340333
mask = X0101000011011000X0X001111011X100101
mem[65392] = 7496387
mem[3310] = 10949
mem[54021] = 1018
mem[39182] = 1015
mask = 00011X00XX10110X0X00000XX000000010XX
mem[29258] = 32355
mem[21927] = 415005978
mem[7720] = 400318
mask = XX101X00001011X010011110100001X10011
mem[19357] = 698
mem[39816] = 38859710
mem[33161] = 721879
mem[51029] = 1020
mem[63289] = 63403541
mem[44874] = 130864184
mem[22915] = 165664389
mask = 001110000111X1XX0X0X1XX1100X010X1110
mem[42040] = 243356019
mem[37748] = 7353
mem[62516] = 326
mem[16620] = 361
mem[64585] = 46439
mem[28563] = 1986
mem[39009] = 628217
mask = 01X11X01010011X100101X010000101101X1
mem[24198] = 1466
mem[15002] = 634696
mem[26199] = 119807597
mem[23206] = 655878
mem[8193] = 4004526
mem[41317] = 2850662
mask = 1110X0001110X10001101000X100000000X0
mem[44279] = 36824
mem[26815] = 6522802
mem[14909] = 17326
mask = 0001110001X0110110XX00011X10X1001000
mem[1962] = 1442842
mem[57522] = 3608
mem[63355] = 1650944
mem[56904] = 2521022
mask = XXX111XX1110X10101001X01001111000XX1
mem[56039] = 13855
mem[48222] = 13842
mem[57251] = 110043295
mem[896] = 7181
mem[64594] = 3483
mask = 00011X000X1011001000011111XX00100010
mem[41571] = 63539
mem[39714] = 1004729334
mem[33630] = 31829390
mask = 001010011010X1001XX00000X1000110011X
mem[12774] = 219393591
mem[39801] = 6063
mem[17417] = 188732
mem[33878] = 117640
mem[9589] = 349
mask = 1011X00011X11X1000X011100X0111000X01
mem[50450] = 627875
mem[64553] = 99
mem[64585] = 1273168
mem[6757] = 3017
mem[14356] = 5008
mem[29258] = 1655
mem[11413] = 60359360
mask = 0010X0X0XX101100010X001111X1X1110001
mem[37311] = 436389854
mem[62848] = 350102481
mem[54021] = 3272
mem[13433] = 2181
mem[32818] = 1561170
mem[61100] = 144227
mask = 0111110X011X11X10100111XX00XX101XX01
mem[51399] = 1972
mem[5042] = 926644
mem[11375] = 259250573
mem[41416] = 936
mem[12700] = 246505
mem[57540] = 2923524
mem[8321] = 70934934
mask = 0X11X0000110010000001001XX0000110X10
mem[21546] = 912416315
mem[29145] = 99559
mem[16528] = 29459665
mem[13846] = 6110601
mem[6104] = 13330
mem[62308] = 31534
mem[64601] = 494
mask = 0001X1X101101X0X1X00X101101X1011010X
mem[35524] = 261536
mem[39801] = 310749971
mem[46522] = 1236
mem[4129] = 1844
mem[6315] = 6569
mem[32886] = 168
mem[42248] = 11892434
mask = 1XX11001110X000010000X00000X00100001
mem[34337] = 3847
mem[8390] = 8155520
mem[62768] = 5218234
mem[29841] = 249705
mask = 01011101X10X1111000011X1101XX1110101
mem[40491] = 11567
mem[29057] = 5710533
mem[7221] = 1098
mem[57270] = 997670442
mask = 001010X100101X00X00001XX01X000011010
mem[54373] = 3875
mem[41275] = 111847
mem[15151] = 45571
mem[22776] = 8162199
mask = X01110X0111XXX0000001X11111110000X01
mem[106] = 5774051
mem[41573] = 7822355
mask = 001110X0011X01X00X0X110X0X0000010X1X
mem[39101] = 17209596
mem[57877] = 216131041
mem[63978] = 643398
mem[10351] = 15285
mem[35863] = 23302872
mask = 001010X011101100010001X0100101X0000X
mem[20499] = 211562966
mem[46546] = 1635565
mem[45815] = 18600505
mem[65441] = 25793
mem[48867] = 4021120
mask = X11010001110X10001X011X001001X1100XX
mem[49457] = 476570
mem[26669] = 4266538
mem[50839] = 9507231
mem[54766] = 1208643
mem[49279] = 2607329
mem[20912] = 1119428
mask = 00X111X011X0110100000001001001001X10
mem[3981] = 28411
mem[1880] = 357278
mem[31243] = 162
mask = 00011100X1X0X101000X000110XXX1011000
mem[26881] = 21252
mem[10018] = 6965635
mem[47777] = 33385526
mem[46651] = 214034
mem[42585] = 40702649
mem[55569] = 20351
mem[23923] = 253114336
mask = 00XX100000101100X00X1110111XX00101X0
mem[29597] = 1149
mem[21886] = 38689097
mem[37141] = 700
mem[19653] = 273424
mem[50472] = 7691440
mask = XX111X10X111X10001X001X1X1011011X011
mem[8566] = 25451836
mem[39771] = 4721485
mem[44687] = 6594426
mem[42570] = 361
mem[14627] = 64772285
mem[48337] = 1264
mask = X010X0011101001010X0111X000111X000XX
mem[54859] = 36075224
mem[61289] = 1247
mem[31793] = 19842184
mem[15612] = 404768
mask = 10110X01110X1X1000100X1X00100011110X
mem[41092] = 29758
mem[58134] = 1780
mem[30647] = 865419
mem[46184] = 133
mask = 0XX1110101X011X1XXX00011X0X011010001
mem[52020] = 14383756
mem[64473] = 2371708
mem[53688] = 3645018
mem[62848] = 112067628
mem[25377] = 5361
mem[40061] = 584
mem[57896] = 4809281
mask = 0001X1X10X1X1X001X00001X1X0000100100
mem[50150] = 1695
mem[58420] = 95104341
mem[60817] = 4009428
mem[29926] = 1556
mem[28188] = 165994572
mem[44315] = 2054
mask = 0111X0001110X100X000X11111011110000X
mem[40090] = 53578
mem[61376] = 125798
mem[59920] = 2637064
mem[31522] = 223908
mem[41317] = 11020
mem[64504] = 60087919
mem[29083] = 165056
mask = 00X110000110X10X000000X1X0000010X00X
mem[63634] = 156131519
mem[63499] = 37794
mem[54660] = 213384
mem[19357] = 291569507
mem[11793] = 44425775
mem[1569] = 1499
mask = 0111X1XX1110XX0100001011X010X0111010
mem[17747] = 687783
mem[47527] = 43313
mem[46385] = 30062259
mem[39435] = 6225
mask = 00111110111001X0X1XX1X0X10X11X010011
mem[60773] = 4068534
mem[46727] = 88487
mem[45335] = 2899
mem[55714] = 3991
mask = 01X11X0010111111X11X11X0100001010001
mem[50543] = 70
mem[28563] = 17930
mem[14417] = 107070185
mem[19810] = 530758
mem[26195] = 352915721
mem[23620] = 541394
mem[51609] = 68738
mask = 1010100X01X01X0000X01X1X11001XX01101
mem[30706] = 33489
mem[3614] = 97141
mem[47530] = 61588428
mem[54451] = 37
mem[17417] = 3467253
mask = 0XX0X10X00X0XX001X0010100X1000100101
mem[61965] = 25976999
mem[52290] = 83693474
mem[10104] = 172902064
mask = 10101001X100110000X0X111110X11111X10
mem[51399] = 42079173
mem[10104] = 60
mem[42192] = 761948
mask = 01111X1X111001010XX01111X1111101X011
mem[15002] = 5761
mem[57522] = 781049282
mem[58771] = 36590
mem[50845] = 895780041
mask = 1110100X1110X10001X011X0100X1X11XX0X
mem[28451] = 29180808
mem[49154] = 106361
mem[19472] = 962416
mask = X001X1XX011010001X00X1111010X011100X
mem[472] = 20077
mem[44685] = 88446
mem[46048] = 3015039
mem[61697] = 1680
mem[65441] = 420953
mask = 010111X0001XX100010001101X0000001011
mem[7230] = 105401132
mem[37903] = 49164
mem[2407] = 15927
mem[62905] = 2466
mem[6996] = 275026478
mask = 0010X0X0111011000X00101X010000101100
mem[20747] = 130064892
mem[227] = 14848571
mask = 1X101X0011100100X10X11000XX00XX0010X
mem[18075] = 4105
mem[7692] = 10369
mem[34480] = 70016
mem[54747] = 178664159
mem[31770] = 4308718
mem[25940] = 286972
mask = 1X1X100011110X10X000X00XX01001000001
mem[18927] = 433001153
mem[56004] = 381
mem[7713] = 560209289
mem[55758] = 1791814
mem[12953] = 174435
mem[40556] = 1415
mask = X01X101001110XX00001000X10000X010000
mem[62126] = 15628
mem[53714] = 392410
mem[49154] = 13065
mask = 001X1000X0X010XX01X0X000X1000000X100
mem[8723] = 64433454
mem[6757] = 1682978
mem[60483] = 13735
mask = 01011X01011XX1111X001X110000X01100XX
mem[64013] = 806538
mem[51273] = 32346
mask = 00X11101011011010110101X0011110XX001
mem[55121] = 416007913
mem[44077] = 5865583
mem[64585] = 323728
mask = 101X100X11X100X01000100X01000X100001
mem[60817] = 42192
mem[6757] = 4925545
mem[33281] = 6862960
mem[21115] = 11608810
mask = XXX0X11000101X010100X010101X10001000
mem[42505] = 6795
mem[27245] = 671587340
mem[43412] = 8741321
mem[2793] = 1114109
mem[34194] = 2767551
mask = 0X111X0001111101010010001001XX1X1110
mem[21794] = 1041902
mem[22992] = 3666
mem[63730] = 46469539
mask = 000110X10X001101X00X011110X011010001
mem[6617] = 22675825
mem[9131] = 24859225
mask = 001X1X0XX010X10010001X0001000010XX10
mem[28267] = 491581202
mem[7622] = 154622
mem[49279] = 1164052
mem[6361] = 62173
mem[29823] = 6599915
mask = 01X0XX1X0X10110101001010101XX11X1000
mem[50472] = 5878
mem[3981] = 896
mem[39714] = 74
mem[6898] = 1993
mem[8193] = 487
mask = 0001X100111011X000000110X00X01000000
mem[25162] = 323406673
mem[43610] = 647412
mem[54042] = 811029198
mem[13461] = 33008731
mem[17432] = 766541
mem[45290] = 167819285
mask = 00110X000110010000XXX111011101010010
mem[10481] = 1969
mem[61056] = 100302708
mem[62768] = 97484359
mask = 0X0XX100001X11XX0100010010X001001X10
mem[11117] = 90479
mem[51399] = 5088
mem[65489] = 273
mem[29185] = 9519
mem[46096] = 669
mask = 01111X0XXX111X11X1X01010100X01X00001
mem[6256] = 8901226
mem[38934] = 11506
mem[4000] = 49916408
mem[31753] = 7960142
mem[61777] = 22041
mask = X11110001110110X000X011100X00XX00001
mem[37652] = 309890
mem[4955] = 6491368
mask = 0X1X110000X00X001000011000100110X011
mem[35882] = 20171
mem[14041] = 542
mem[973] = 33148060
mem[61056] = 2230
mem[30545] = 2890
mem[48094] = 745799437
mask = 1011000011X1111000X0X1XX11X1X10X0101
mem[61322] = 765242
mem[6315] = 7001612
mem[11278] = 12973
mem[59259] = 2040
mem[46184] = 498
mask = X01X10101X1X0100000X10101011X110X011
mem[1103] = 6682
mem[49066] = 528792283
mem[42040] = 222766
"""
