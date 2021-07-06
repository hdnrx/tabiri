'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "6e7531dda32925c081584660c138f1a6",
"assets/assets/fonts/openSans/OpenSans-Bold.ttf": "1025a6e0fb0fa86f17f57cc82a6b9756",
"assets/assets/fonts/openSans/OpenSans-Regular.ttf": "3ed9575dcc488c3e3a5bd66620bdf5a4",
"assets/assets/fonts/openSans/OpenSans-SemiBold.ttf": "ba5cde21eeea0d57ab7efefc99596cce",
"assets/assets/images/avatar/birthmark.png": "a9b02c4121d9fe4a29bd85610eb5814b",
"assets/assets/images/avatar/drawingBlock.png": "b7ddffa76d9aa5a57aef841c6bcbef01",
"assets/assets/images/avatar/gene.png": "c25704cd35d499412debb864679045fb",
"assets/assets/images/avatar/man/man_40-55_black_complete.png": "61ac284888b698ff29203a304a501b0c",
"assets/assets/images/avatar/man/man_40-55_black_exam.png": "849ea922af4335212c95536565c677a8",
"assets/assets/images/avatar/man/man_40-55_black_portrait.png": "ec10dbe44591c9b5d3aa3371bb2f81d8",
"assets/assets/images/avatar/man/man_40-55_blond_complete.png": "426a1347f90536d5fb37dd748bfaa5ff",
"assets/assets/images/avatar/man/man_40-55_blond_exam.png": "807d0194ced030970f202aadf503b379",
"assets/assets/images/avatar/man/man_40-55_blond_portrait.png": "b38e6a445fee579840bbad17b20919e1",
"assets/assets/images/avatar/man/man_40-55_darkBrown_complete.png": "a0ce11cf47e654e2294cd0112aaa65ce",
"assets/assets/images/avatar/man/man_40-55_darkBrown_exam.png": "15c88059ab4618c0e43f2d39d4f4e356",
"assets/assets/images/avatar/man/man_40-55_darkBrown_portrait.png": "fb91b9e002f661600b170906cc7d48d2",
"assets/assets/images/avatar/man/man_40-55_lightBrown_complete.png": "5a38ceb5d3a5c65bc798b8cb8498c07f",
"assets/assets/images/avatar/man/man_40-55_lightBrown_exam.png": "5be1955b798873286cfbbd6327275417",
"assets/assets/images/avatar/man/man_40-55_lightBrown_portrait.png": "ef98f22250bd884850d8a973d3d491a0",
"assets/assets/images/avatar/man/man_40-55_placeholder_complete.png": "5427a7984a5a0aa9b43cc3359ecc33dd",
"assets/assets/images/avatar/man/man_40-55_placeholder_portrait.png": "158ad8c91b3a79a61fede34bf2f5a08f",
"assets/assets/images/avatar/man/man_40-55_red_complete.png": "253fd56b5939b12036bd170fb4e7f388",
"assets/assets/images/avatar/man/man_40-55_red_exam.png": "2e55d1d30afbbf4c305660e55fab10a6",
"assets/assets/images/avatar/man/man_40-55_red_portrait.png": "4ce19191f8adfd73738211327d252312",
"assets/assets/images/avatar/man/man_40-_black_complete.png": "0d835f809c2b63ceda8e8af5a631991b",
"assets/assets/images/avatar/man/man_40-_black_exam.png": "712fb98a1a3fdd928b1063480f200f4a",
"assets/assets/images/avatar/man/man_40-_black_portrait.png": "c18207a358662d4ad955979f5477ce1a",
"assets/assets/images/avatar/man/man_40-_blond_complete.png": "3778054fe0e30c4adb0986c21f892708",
"assets/assets/images/avatar/man/man_40-_blond_exam.png": "ef30b48e6104392a11d88b7df06b9a04",
"assets/assets/images/avatar/man/man_40-_blond_portrait.png": "208e3094296651844b0d28ceb9624138",
"assets/assets/images/avatar/man/man_40-_darkBrown_complete.png": "85f1f016a4955c2bbdc827b8923ebd64",
"assets/assets/images/avatar/man/man_40-_darkBrown_exam.png": "3c63271b5145a17924fe4ac9441d22b2",
"assets/assets/images/avatar/man/man_40-_darkBrown_portrait.png": "b095385fc5a574e3a36c0be78a22618b",
"assets/assets/images/avatar/man/man_40-_lightBrown_complete.png": "3aafc6ec5637b22b697610db77d9b209",
"assets/assets/images/avatar/man/man_40-_lightBrown_exam.png": "19a9b99af63a82e1e486083890c34e00",
"assets/assets/images/avatar/man/man_40-_lightBrown_portrait.png": "277ce52bb3d576befafeb4a00c18d9f7",
"assets/assets/images/avatar/man/man_40-_placeholder_complete.png": "7a240be5fcad1ef7471cb89dd0f7c7e3",
"assets/assets/images/avatar/man/man_40-_placeholder_portrait.png": "23098878bbf7f571ea0120db5dc3e5a8",
"assets/assets/images/avatar/man/man_40-_red_complete.png": "46bfef02ea3b7b2a2db368fbe136e070",
"assets/assets/images/avatar/man/man_40-_red_exam.png": "a2cded097f574c9755cc2eeb41ae338e",
"assets/assets/images/avatar/man/man_40-_red_portrait.png": "cf60df8be06ed538d0ea636bc1413625",
"assets/assets/images/avatar/man/man_55-65_black_complete.png": "0218712f7391d5ed3ffa649949c56803",
"assets/assets/images/avatar/man/man_55-65_black_exam.png": "c198cae396b76690cb71f399c803ec02",
"assets/assets/images/avatar/man/man_55-65_black_portrait.png": "9dde90ec3441c60a88cb27613778a182",
"assets/assets/images/avatar/man/man_55-65_blond_complete.png": "f4a30f7acfcfd405636905a5637526d8",
"assets/assets/images/avatar/man/man_55-65_blond_exam.png": "3267e0a0b84d783703367d57ca122953",
"assets/assets/images/avatar/man/man_55-65_blond_portrait.png": "9a96c39ba41464d5113d0f6aac755a25",
"assets/assets/images/avatar/man/man_55-65_darkBrown_complete.png": "56787eb4e41978a6a3bcba385d428662",
"assets/assets/images/avatar/man/man_55-65_darkBrown_exam.png": "00812f6a69b0e5755ad5589aaeefc249",
"assets/assets/images/avatar/man/man_55-65_darkBrown_portrait.png": "76c959db1e827ae39f39b9f3ea68049e",
"assets/assets/images/avatar/man/man_55-65_lightBrown_complete.png": "c77ee73c7355d4ee45f9314a19bdb3c4",
"assets/assets/images/avatar/man/man_55-65_lightBrown_exam.png": "0254ee586144ecdb39743d6af045a1a6",
"assets/assets/images/avatar/man/man_55-65_lightBrown_portrait.png": "23cb92e3ec4558c39dccc1ff753d9c72",
"assets/assets/images/avatar/man/man_55-65_placeholder_complete.png": "74b3f96594c438ae3ddb4a568d01beb9",
"assets/assets/images/avatar/man/man_55-65_placeholder_portrait.png": "eae9150a2199f28e366f115fc58d8396",
"assets/assets/images/avatar/man/man_55-65_red_complete.png": "a61366a182d4d7e2131a993bd6a247b6",
"assets/assets/images/avatar/man/man_55-65_red_exam.png": "d4630f6f87de14b5737a70c8652e7495",
"assets/assets/images/avatar/man/man_55-65_red_portrait.png": "98a6e588621321e4d616556d37956f20",
"assets/assets/images/avatar/man/man_65+_black_complete.png": "250b8c0cee3b922f48a55685958b25a4",
"assets/assets/images/avatar/man/man_65+_black_exam.png": "6c3c071b859b625515190f9e01878f95",
"assets/assets/images/avatar/man/man_65+_black_portrait.png": "e1888a9969739358ca9462bd2add2e86",
"assets/assets/images/avatar/man/man_65+_blond_complete.png": "7c35bad7b535331e068120dffe125995",
"assets/assets/images/avatar/man/man_65+_blond_exam.png": "ae11f659c8f0b584018320a4ad1dc665",
"assets/assets/images/avatar/man/man_65+_blond_portrait.png": "e23ff6a7d95b97d7e7fdcb1dcc8c5f96",
"assets/assets/images/avatar/man/man_65+_darkBrown_complete.png": "ea89af27e57f18ad471aade8be2885ed",
"assets/assets/images/avatar/man/man_65+_darkBrown_exam.png": "be5af6a45f42711b964692471dd08f5e",
"assets/assets/images/avatar/man/man_65+_darkBrown_portrait.png": "b435a96ba4a8e52d93f6bedeca3c7769",
"assets/assets/images/avatar/man/man_65+_lightBrown_complete.png": "5250ba94aff6a27d114ef85528e43c4d",
"assets/assets/images/avatar/man/man_65+_lightBrown_exam.png": "4417df8dad827162b25c350c5bc43407",
"assets/assets/images/avatar/man/man_65+_lightBrown_portrait.png": "88046a0dadd72b19f2b879b91bdd5142",
"assets/assets/images/avatar/man/man_65+_placeholder_complete.png": "c614b76a0bdcb84d7701d15956458a9e",
"assets/assets/images/avatar/man/man_65+_placeholder_portrait.png": "37b3fd332200f24ab91fcd7a32280742",
"assets/assets/images/avatar/man/man_65+_red_complete.png": "6bc76023cdd9c8a286d991e8c6ccc132",
"assets/assets/images/avatar/man/man_65+_red_exam.png": "48726844aedca31c85100c2a0436c419",
"assets/assets/images/avatar/man/man_65+_red_portrait.png": "caeea1ce8f486749b59af4429e195308",
"assets/assets/images/avatar/man/man_placeholder.png": "9854484a4542292781b65286d9fc1f77",
"assets/assets/images/avatar/placeholderFigure.png": "163f87d27f61507130e2908645909f8c",
"assets/assets/images/avatar/redhead.png": "7d8b2535bfa62368fd45a51632577d33",
"assets/assets/images/avatar/skin_sample.png": "b2f638d534af5003243e86159d2d537c",
"assets/assets/images/avatar/sunscreen/sunscreen_few.png": "3c49bf5e892b4ada17999c2484c6f1ef",
"assets/assets/images/avatar/sunscreen/sunscreen_many.png": "9a171656cd3682112fc1a76563f932ab",
"assets/assets/images/avatar/sunscreen/sunscreen_none.png": "50d1b03521967a6a7adf9d61c7dabdc9",
"assets/assets/images/avatar/sunscreen/sunscreen_several.png": "6f32581d13298146750ddde5092fc133",
"assets/assets/images/avatar/woman/woman_40-55_black_complete.png": "905f58bb1b6001cc3aeeecbe1ed3eff4",
"assets/assets/images/avatar/woman/woman_40-55_black_exam.png": "eef9f16ee548e00336649f7a39a69c86",
"assets/assets/images/avatar/woman/woman_40-55_black_portrait.png": "05bff38050d2a87eb11064f32b1ab60c",
"assets/assets/images/avatar/woman/woman_40-55_blond_complete.png": "de91fc1790be26edad9886c48c98e5e5",
"assets/assets/images/avatar/woman/woman_40-55_blond_exam.png": "7c685696a4b907407ea403ef11c0c8d0",
"assets/assets/images/avatar/woman/woman_40-55_blond_portrait.png": "4502751fb43a0afaf4751d74054238ff",
"assets/assets/images/avatar/woman/woman_40-55_darkBrown_complete.png": "c7d42cdad58cec06ce4526fa00f628c8",
"assets/assets/images/avatar/woman/woman_40-55_darkBrown_exam.png": "1f764cdc7c94062f0f624f6a67d712aa",
"assets/assets/images/avatar/woman/woman_40-55_darkBrown_portrait.png": "e18220e9f8b88240da7f36b63569ba71",
"assets/assets/images/avatar/woman/woman_40-55_lightBrown_complete.png": "923e29af7cbb93b9ad4eb325437918fd",
"assets/assets/images/avatar/woman/woman_40-55_lightBrown_exam.png": "bca001e58026ec76e4d0cf3489a0f019",
"assets/assets/images/avatar/woman/woman_40-55_lightBrown_portrait.png": "1e7a383ec4a1457522a21f12e2959193",
"assets/assets/images/avatar/woman/woman_40-55_placeholder_complete.png": "61504a71e361ed92166761d8273162a3",
"assets/assets/images/avatar/woman/woman_40-55_placeholder_portrait.png": "9089e853cf3c62a756c64a95488d669f",
"assets/assets/images/avatar/woman/woman_40-55_red_complete.png": "206f9998dd61f4276913bd4815d8680c",
"assets/assets/images/avatar/woman/woman_40-55_red_exam.png": "b4bd85e846cba58fac5c535695017291",
"assets/assets/images/avatar/woman/woman_40-55_red_portrait.png": "5325b2d45323b49ed438e25a6c0a49b2",
"assets/assets/images/avatar/woman/woman_40-_black_complete.png": "95e136ee7ae678680b101139c3ab0a94",
"assets/assets/images/avatar/woman/woman_40-_black_exam.png": "10fe70d513385912af76a06ea9ba9070",
"assets/assets/images/avatar/woman/woman_40-_black_portrait.png": "a28320e3fcddb5bd149410206d7b6636",
"assets/assets/images/avatar/woman/woman_40-_blond_complete.png": "43ab33a529b6dbe7b9f9ea4d7a940b7b",
"assets/assets/images/avatar/woman/woman_40-_blond_exam.png": "35dd55636705d6c9f98233929aa708a0",
"assets/assets/images/avatar/woman/woman_40-_blond_portrait.png": "a56c7c798ddf79145f09f3c68335276d",
"assets/assets/images/avatar/woman/woman_40-_darkBrown_complete.png": "275e62be5104aee132133b7838554ba1",
"assets/assets/images/avatar/woman/woman_40-_darkBrown_exam.png": "eb586ebd3eb226bee828749908507cc3",
"assets/assets/images/avatar/woman/woman_40-_darkBrown_portrait.png": "3310a410fd8650390c766c473dac982d",
"assets/assets/images/avatar/woman/woman_40-_lightBrown_complete.png": "40f156d538ef612f3feea3e55b731609",
"assets/assets/images/avatar/woman/woman_40-_lightBrown_exam.png": "361e180eea9f5d4c0793f75623b6a2e4",
"assets/assets/images/avatar/woman/woman_40-_lightBrown_portrait.png": "df9d102a0d37d02417fe719961d036f8",
"assets/assets/images/avatar/woman/woman_40-_placeholder_complete.png": "d157cfdfc079d53d1eba0db82c885f5a",
"assets/assets/images/avatar/woman/woman_40-_placeholder_portrait.png": "350337e42745482e365951df79acb6ac",
"assets/assets/images/avatar/woman/woman_40-_red_complete.png": "ab883c3161f50a39540183516a0eabc1",
"assets/assets/images/avatar/woman/woman_40-_red_exam.png": "d0b5405bf9b32c535940cbfc045e691b",
"assets/assets/images/avatar/woman/woman_40-_red_portrait.png": "1405123459a36add860d5364879a455e",
"assets/assets/images/avatar/woman/woman_55-65_black_complete.png": "74d36961166fd032bc534eb1959085df",
"assets/assets/images/avatar/woman/woman_55-65_black_exam.png": "b1669f4074b436bd322d7672d7b18456",
"assets/assets/images/avatar/woman/woman_55-65_black_portrait.png": "b4cf9891a10a96c2a9f52cc01551232a",
"assets/assets/images/avatar/woman/woman_55-65_blond_complete.png": "ff6563a601e5355ae222576173acbad8",
"assets/assets/images/avatar/woman/woman_55-65_blond_exam.png": "169458477fa0521fd74e26ccc631e78b",
"assets/assets/images/avatar/woman/woman_55-65_blond_portrait.png": "5be86c5ee85d16aaa3e794e6790a57fb",
"assets/assets/images/avatar/woman/woman_55-65_darkBrown_complete.png": "dabf365f8002f05e0fee60cd3e0d37b4",
"assets/assets/images/avatar/woman/woman_55-65_darkBrown_exam.png": "ac40bb468218466e0e7951f8d4e770b8",
"assets/assets/images/avatar/woman/woman_55-65_darkBrown_portrait.png": "c07ae5a7b33d5e6f0508b45f270ad942",
"assets/assets/images/avatar/woman/woman_55-65_lightBrown_complete.png": "ccaf2c310677ffce1ffe52494dd1c9c2",
"assets/assets/images/avatar/woman/woman_55-65_lightBrown_exam.png": "52b1d79351f5c780f2a3d9daf28216d5",
"assets/assets/images/avatar/woman/woman_55-65_lightBrown_portrait.png": "ae2b5d8802e6a2fc0e45dcdffab8d8c5",
"assets/assets/images/avatar/woman/woman_55-65_placeholder_complete.png": "12924ce2a67b51f7948c7c4ddde1742c",
"assets/assets/images/avatar/woman/woman_55-65_placeholder_portrait.png": "18a6b6bf3d0da749f14fb2ab8e042ac1",
"assets/assets/images/avatar/woman/woman_55-65_red_complete.png": "a5f844df1671bec9e7e91d1d5372f94e",
"assets/assets/images/avatar/woman/woman_55-65_red_exam.png": "b2aab356590c0a6835257034eb7b79df",
"assets/assets/images/avatar/woman/woman_55-65_red_portrait.png": "31d83ca5332074fb2c73de09cedd3d41",
"assets/assets/images/avatar/woman/woman_65+_black_complete.png": "3aac6cb201a49c20b9376c3d65ffe966",
"assets/assets/images/avatar/woman/woman_65+_black_exam.png": "d28dff9462f2f59d0c0073f16aa8926a",
"assets/assets/images/avatar/woman/woman_65+_black_portrait.png": "625f4e844ed60ad966676f6a3a2fb4ed",
"assets/assets/images/avatar/woman/woman_65+_blond_complete.png": "9a64bc494ba09430ce329b24b3661828",
"assets/assets/images/avatar/woman/woman_65+_blond_exam.png": "d28ae3ce964b85c201054cffff0a9731",
"assets/assets/images/avatar/woman/woman_65+_blond_portrait.png": "e2685c0b611bad8235a5c46efda99a5a",
"assets/assets/images/avatar/woman/woman_65+_darkBrown_complete.png": "cbc2c48c66441bad761c036228903dfd",
"assets/assets/images/avatar/woman/woman_65+_darkBrown_exam.png": "655fbab1381e9b3118c99ded68ba987e",
"assets/assets/images/avatar/woman/woman_65+_darkBrown_portrait.png": "9b74c53fda32a1ccfeb0251e6ab572f7",
"assets/assets/images/avatar/woman/woman_65+_lightBrown_complete.png": "aff97d8d758b8c362c764ce3f81215e1",
"assets/assets/images/avatar/woman/woman_65+_lightBrown_exam.png": "4de4eb3261c7f5245c517142e0340bfc",
"assets/assets/images/avatar/woman/woman_65+_lightBrown_portrait.png": "2a7e09592afc31cf66e0d3594c7c9f01",
"assets/assets/images/avatar/woman/woman_65+_placeholder_complete.png": "0c1989cca98f6149fa6375307166a4b9",
"assets/assets/images/avatar/woman/woman_65+_placeholder_portrait.png": "14ae9d9149f92c6ee317e571b8e7ea4d",
"assets/assets/images/avatar/woman/woman_65+_red_complete.png": "828de9798db28f1ddcc87eac56a754b3",
"assets/assets/images/avatar/woman/woman_65+_red_exam.png": "175b22106c291a7df90c601f17f8eb47",
"assets/assets/images/avatar/woman/woman_65+_red_portrait.png": "b3bc983783fc0c8a575a50fb69f6ab53",
"assets/assets/images/avatar/woman/woman_placeholder.png": "0ab1bb54c8db723a33cf38f5734f8814",
"assets/assets/images/BritishFlag.png": "8d29c837028074ada6cb9f9cbae01924",
"assets/assets/images/EasyFlag.png": "0f3d539e5b1d8940aeee0f8ccf84a779",
"assets/assets/images/GermanFlag.png": "a1375ec5d3a58efbc336cf5a223d3922",
"assets/assets/images/header/exit.png": "863209a5e029feeb88d9e46afb21bce0",
"assets/assets/images/header/menu.png": "b46f58f1d453522b04b0cae964cdaced",
"assets/assets/images/home/appointment.png": "6eab4b9d8e192693f52253c1e319b84c",
"assets/assets/images/home/avatar.png": "8d4c12903ab2d1d1c378731f909a2983",
"assets/assets/images/home/cardOneBackground.png": "bf20034674a617ecde138c634c2b86ab",
"assets/assets/images/home/cardThreeBackground.png": "50b145b3ff5b504cdb4ae80def4b3bbc",
"assets/assets/images/home/cardTwoBackground.png": "ba5d9ab946c7b355443fcf8c048dfc98",
"assets/assets/images/home/information.png": "ee6336e5137e457be2982065b643b4c9",
"assets/assets/images/home/protection.png": "ca96ea56a138d6ddcd628652b4e86f97",
"assets/assets/images/information/hautprobe_lang.png": "f6d48e95d852a8f7a702c8bba18300a4",
"assets/assets/images/information/haut_doppel.png": "e9fdb0239fa1c14aff587dc21fef2006",
"assets/assets/images/information/haut_doppel_dark.png": "3484657fc2db2472ac0ce2b7f6579de3",
"assets/assets/images/information/haut_doppel_white.png": "c8877945bda19015d8cbfef6e78fb375",
"assets/assets/images/logos/logo_deutsche-krebshilfe.png": "3e215d95fe01350a0e618958e5faceab",
"assets/assets/images/logos/logo_hochschule-trier.png": "51383d0fb598042649df50762c3f8de4",
"assets/assets/images/logos/logo_tabiri.png": "241aa732c6aed074d06d55cb765d7c7e",
"assets/assets/images/logos/logo_uni-luebeck.png": "68350c20e90503637a78d86f90e4ec3b",
"assets/assets/images/prevention/prevention_1.png": "26f370ad26ddebb3b3b1401409c376be",
"assets/assets/images/prevention/prevention_2.png": "3be53c1340fab65d85ac2d7ea9cfe0aa",
"assets/assets/images/protection/doctor_2.png": "89f1934461685cd2c39c1bed30b1d59b",
"assets/assets/images/protection/preventionCardBackground.png": "aefed973aa5b3c21121e79b61c6dce62",
"assets/assets/images/protection/screeningCardBackground.png": "1c2dbed0311334cc084dbd5f36bcf0ae",
"assets/assets/images/result/continueButton.png": "f1e2fd245d3f02fe70d277b0ff947142",
"assets/assets/images/result/downButton.png": "1d7b6ed9b2b2963611da3af2ff9eb507",
"assets/assets/images/result/highRisk.png": "b5c0963c26be0cd87ff5c1d37605dfc5",
"assets/assets/images/result/lowRisk.png": "8a968a9566f2c614b89c12eef1d01b76",
"assets/assets/images/result/mediumRisk.png": "4f2fb313179e5fd329db848104f02227",
"assets/assets/images/result/resultCheck_background.png": "019af5fc8422f81652ebf126224be75e",
"assets/assets/images/result/result_1.png": "cd7f67ffe40c749ae4cd8fa9b45dd679",
"assets/assets/images/result/result_background_one.png": "c6f04ce7396643c177718d16d5bbea7a",
"assets/assets/images/result/result_background_three.png": "dd877cbd9db5f166422e0499eb033af6",
"assets/assets/images/result/result_background_two.png": "589d0a03bea0bda948ee5226e35c3ad4",
"assets/assets/images/result/stopSign.png": "50de4009678b85347905bbac8959904a",
"assets/assets/images/result/unknownRisk.png": "feabd6b14cabfb94fd8f314aba1c4552",
"assets/assets/images/result/upButton.png": "3364bf360686a64c943be4667f73bd43",
"assets/assets/images/result/veryHighRisk.png": "be71259e7b90dddd1f8f5dd6026455b0",
"assets/assets/images/screening/doctor_1.png": "9f366167649249aa63d13164defe1126",
"assets/assets/images/screening/krankenhaus.png": "74c286cc2955b25f49f81d201995ad26",
"assets/assets/images/screening/lichtlupe.png": "79f2fad2185f9a31902d08ef7664a9cb",
"assets/assets/images/screening/microscope.png": "85a9ecb6c8ffa0c273d83950e1677605",
"assets/assets/images/screening/r%25C3%25BCckenmelanom.png": "c2ce363fd1824c89cfdfaaf334afcb17",
"assets/assets/images/screening/termin.png": "6128f8be6436cfce5ab8abd8a51f2a74",
"assets/FontManifest.json": "d19df30ab9d3c31d201e8e4ae604f24e",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/NOTICES": "6c67e8ac99ab2cc1a292cb8af0419767",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "0fde8030b98489451fd8de1b77d53443",
"/": "0fde8030b98489451fd8de1b77d53443",
"main.dart.js": "ffe635cf6c9116c51dfd381dd84e1e3c",
"manifest.json": "0bf404ba6fb5df0d9e8c3fcb4e15594d",
"version.json": "ef8aba205d5d76752eef0cb37fb7c8b0"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
