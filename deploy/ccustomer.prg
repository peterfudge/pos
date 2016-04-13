SET CLASSLIB TO wwBusiness ADDITIVE
SET CLASSLIB TO wwUtils ADDITIVE
SET PROCEDURE TO wwCollections ADDITIVE
SET PROCEDURE TO ccustomer.prg ADDITIVE

*************************************************************
DEFINE CLASS ccustomer AS wwBusiness
*************************************************************

cAlias = "arcust01"
cDataPath = "y:\pro32\ardata\"
cFileName = "arcust01"

cPkField = "custno"
cIdTable = "app_id"

*** Sql Connection String
cConnectString = ""

*** 0 - fox 2 - Sql 4-Web
nDataMode = 0

*************************************************************
FUNCTION CreateTable(lcFileName)
*************************************************************
LOCAL lxFields

IF EMPTY(lcFileName)
   lcFileName = THIS.cDataPath + THIS.cFileName
ENDIF

IF THIS.nDataMode = 0

*** Generated on: 04/06/2016
DIMENSION lxFields[196,4]

lxFields[  1,1]='CUSTNO'
lxFields[  1,2]='C'
lxFields[  1,3]=  6
lxFields[  1,4]=  0
lxFields[  2,1]='COMPANY'
lxFields[  2,2]='C'
lxFields[  2,3]= 35
lxFields[  2,4]=  0
lxFields[  3,1]='CONTACT'
lxFields[  3,2]='C'
lxFields[  3,3]= 30
lxFields[  3,4]=  0
lxFields[  4,1]='TITLE'
lxFields[  4,2]='C'
lxFields[  4,3]= 30
lxFields[  4,4]=  0
lxFields[  5,1]='ADDRESS1'
lxFields[  5,2]='C'
lxFields[  5,3]= 35
lxFields[  5,4]=  0
lxFields[  6,1]='ADDRESS2'
lxFields[  6,2]='C'
lxFields[  6,3]= 35
lxFields[  6,4]=  0
lxFields[  7,1]='CITY'
lxFields[  7,2]='C'
lxFields[  7,3]= 20
lxFields[  7,4]=  0
lxFields[  8,1]='ZIP'
lxFields[  8,2]='C'
lxFields[  8,3]= 10
lxFields[  8,4]=  0
lxFields[  9,1]='COUNTRY'
lxFields[  9,2]='C'
lxFields[  9,3]= 15
lxFields[  9,4]=  0
lxFields[ 10,1]='PHONE'
lxFields[ 10,2]='C'
lxFields[ 10,3]= 20
lxFields[ 10,4]=  0
lxFields[ 11,1]='PHONE2'
lxFields[ 11,2]='C'
lxFields[ 11,3]= 20
lxFields[ 11,4]=  0
lxFields[ 12,1]='TERR'
lxFields[ 12,2]='C'
lxFields[ 12,3]=  3
lxFields[ 12,4]=  0
lxFields[ 13,1]='INDUST'
lxFields[ 13,2]='C'
lxFields[ 13,3]=  8
lxFields[ 13,4]=  0
lxFields[ 14,1]='SALESMN'
lxFields[ 14,2]='C'
lxFields[ 14,3]=  4
lxFields[ 14,4]=  0
lxFields[ 15,1]='SOURCE'
lxFields[ 15,2]='C'
lxFields[ 15,3]= 15
lxFields[ 15,4]=  0
lxFields[ 16,1]='CODE'
lxFields[ 16,2]='C'
lxFields[ 16,3]=  2
lxFields[ 16,4]=  0
lxFields[ 17,1]='TYPE'
lxFields[ 17,2]='C'
lxFields[ 17,3]=  8
lxFields[ 17,4]=  0
lxFields[ 18,1]='PTERMS'
lxFields[ 18,2]='C'
lxFields[ 18,3]= 20
lxFields[ 18,4]=  0
lxFields[ 19,1]='PDISC'
lxFields[ 19,2]='N'
lxFields[ 19,3]=  7
lxFields[ 19,4]=  3
lxFields[ 20,1]='PDAYS'
lxFields[ 20,2]='N'
lxFields[ 20,3]=  3
lxFields[ 20,4]=  0
lxFields[ 21,1]='PNET'
lxFields[ 21,2]='N'
lxFields[ 21,3]=  3
lxFields[ 21,4]=  0
lxFields[ 22,1]='SVC'
lxFields[ 22,2]='N'
lxFields[ 22,3]=  7
lxFields[ 22,4]=  3
lxFields[ 23,1]='TAX'
lxFields[ 23,2]='N'
lxFields[ 23,3]=  7
lxFields[ 23,4]=  3
lxFields[ 24,1]='DISC'
lxFields[ 24,2]='N'
lxFields[ 24,3]=  7
lxFields[ 24,4]=  3
lxFields[ 25,1]='LDATE'
lxFields[ 25,2]='D'
lxFields[ 25,3]=  8
lxFields[ 25,4]=  0
lxFields[ 26,1]='LASTPAY'
lxFields[ 26,2]='D'
lxFields[ 26,3]=  8
lxFields[ 26,4]=  0
lxFields[ 27,1]='ENTERED'
lxFields[ 27,2]='D'
lxFields[ 27,3]=  8
lxFields[ 27,4]=  0
lxFields[ 28,1]='BALANCE'
lxFields[ 28,2]='Y'
lxFields[ 28,3]=  8
lxFields[ 28,4]=  4
lxFields[ 29,1]='HIBALANCE'
lxFields[ 29,2]='Y'
lxFields[ 29,3]=  8
lxFields[ 29,4]=  4
lxFields[ 30,1]='PTDSLS'
lxFields[ 30,2]='Y'
lxFields[ 30,3]=  8
lxFields[ 30,4]=  4
lxFields[ 31,1]='YTDSLS'
lxFields[ 31,2]='Y'
lxFields[ 31,3]=  8
lxFields[ 31,4]=  4
lxFields[ 32,1]='ONORDER'
lxFields[ 32,2]='Y'
lxFields[ 32,3]=  8
lxFields[ 32,4]=  4
lxFields[ 33,1]='CREDIT'
lxFields[ 33,2]='Y'
lxFields[ 33,3]=  8
lxFields[ 33,4]=  4
lxFields[ 34,1]='LPYMT'
lxFields[ 34,2]='Y'
lxFields[ 34,3]=  8
lxFields[ 34,4]=  4
lxFields[ 35,1]='LSALE'
lxFields[ 35,2]='Y'
lxFields[ 35,3]=  8
lxFields[ 35,4]=  4
lxFields[ 36,1]='PMTDAYS'
lxFields[ 36,2]='N'
lxFields[ 36,3]=  6
lxFields[ 36,4]=  1
lxFields[ 37,1]='GLLINK'
lxFields[ 37,2]='C'
lxFields[ 37,3]=  3
lxFields[ 37,4]=  0
lxFields[ 38,1]='ARACCT'
lxFields[ 38,2]='C'
lxFields[ 38,3]= 24
lxFields[ 38,4]=  0
lxFields[ 39,1]='SLTXACT'
lxFields[ 39,2]='C'
lxFields[ 39,3]= 24
lxFields[ 39,4]=  0
lxFields[ 40,1]='FCHGACT'
lxFields[ 40,2]='C'
lxFields[ 40,3]= 24
lxFields[ 40,4]=  0
lxFields[ 41,1]='COMMENT'
lxFields[ 41,2]='C'
lxFields[ 41,3]= 65
lxFields[ 41,4]=  0
lxFields[ 42,1]='HISTORY'
lxFields[ 42,2]='C'
lxFields[ 42,3]=  1
lxFields[ 42,4]=  0
lxFields[ 43,1]='PRICECODE'
lxFields[ 43,2]='C'
lxFields[ 43,3]=  3
lxFields[ 43,4]=  0
lxFields[ 44,1]='TAXCODE'
lxFields[ 44,2]='C'
lxFields[ 44,3]=  6
lxFields[ 44,4]=  0
lxFields[ 45,1]='CURRENCY'
lxFields[ 45,2]='C'
lxFields[ 45,3]=  3
lxFields[ 45,4]=  0
lxFields[ 46,1]='FLAGS'
lxFields[ 46,2]='C'
lxFields[ 46,3]= 10
lxFields[ 46,4]=  0
lxFields[ 47,1]='CSTNUM1'
lxFields[ 47,2]='N'
lxFields[ 47,3]=  9
lxFields[ 47,4]=  0
lxFields[ 48,1]='CSTNUM2'
lxFields[ 48,2]='N'
lxFields[ 48,3]=  9
lxFields[ 48,4]=  0
lxFields[ 49,1]='LSTCALL'
lxFields[ 49,2]='D'
lxFields[ 49,3]=  8
lxFields[ 49,4]=  0
lxFields[ 50,1]='DEALER'
lxFields[ 50,2]='C'
lxFields[ 50,3]= 10
lxFields[ 50,4]=  0
lxFields[ 51,1]='FAXNO'
lxFields[ 51,2]='C'
lxFields[ 51,3]= 20
lxFields[ 51,4]=  0
lxFields[ 52,1]='TAXDIST'
lxFields[ 52,2]='C'
lxFields[ 52,3]=  4
lxFields[ 52,4]=  0
lxFields[ 53,1]='STATFMT'
lxFields[ 53,2]='C'
lxFields[ 53,3]=  1
lxFields[ 53,4]=  0
lxFields[ 54,1]='FORWARD'
lxFields[ 54,2]='Y'
lxFields[ 54,3]=  8
lxFields[ 54,4]=  4
lxFields[ 55,1]='TAXTBL'
lxFields[ 55,2]='C'
lxFields[ 55,3]= 10
lxFields[ 55,4]=  0
lxFields[ 56,1]='STAXCRT'
lxFields[ 56,2]='L'
lxFields[ 56,3]=  1
lxFields[ 56,4]=  0
lxFields[ 57,1]='EMAIL'
lxFields[ 57,2]='M'
lxFields[ 57,3]=  4
lxFields[ 57,4]=  0
lxFields[ 58,1]='CSTMEMO'
lxFields[ 58,2]='M'
lxFields[ 58,3]=  4
lxFields[ 58,4]=  0
lxFields[ 59,1]='ADDUSER'
lxFields[ 59,2]='C'
lxFields[ 59,3]=  4
lxFields[ 59,4]=  0
lxFields[ 60,1]='ADDDATE'
lxFields[ 60,2]='D'
lxFields[ 60,3]=  8
lxFields[ 60,4]=  0
lxFields[ 61,1]='ADDTIME'
lxFields[ 61,2]='C'
lxFields[ 61,3]=  8
lxFields[ 61,4]=  0
lxFields[ 62,1]='LCKSTAT'
lxFields[ 62,2]='C'
lxFields[ 62,3]=  1
lxFields[ 62,4]=  0
lxFields[ 63,1]='LCKUSER'
lxFields[ 63,2]='C'
lxFields[ 63,3]=  4
lxFields[ 63,4]=  0
lxFields[ 64,1]='LCKDATE'
lxFields[ 64,2]='D'
lxFields[ 64,3]=  8
lxFields[ 64,4]=  0
lxFields[ 65,1]='LCKTIME'
lxFields[ 65,2]='C'
lxFields[ 65,3]=  8
lxFields[ 65,4]=  0
lxFields[ 66,1]='LATITUDE'
lxFields[ 66,2]='N'
lxFields[ 66,3]=  9
lxFields[ 66,4]=  5
lxFields[ 67,1]='LONGITUDE'
lxFields[ 67,2]='N'
lxFields[ 67,3]= 10
lxFields[ 67,4]=  6
lxFields[ 68,1]='ADDCODE'
lxFields[ 68,2]='C'
lxFields[ 68,3]= 25
lxFields[ 68,4]=  0
lxFields[ 69,1]='ADDFORMAT'
lxFields[ 69,2]='C'
lxFields[ 69,3]=  1
lxFields[ 69,4]=  0
lxFields[ 70,1]='ALT_CUSTNO'
lxFields[ 70,2]='C'
lxFields[ 70,3]= 10
lxFields[ 70,4]=  0
lxFields[ 71,1]='BCODE'
lxFields[ 71,2]='C'
lxFields[ 71,3]=  2
lxFields[ 71,4]=  0
lxFields[ 72,1]='CARRIERRT'
lxFields[ 72,2]='C'
lxFields[ 72,3]=  7
lxFields[ 72,4]=  0
lxFields[ 73,1]='CFREQ'
lxFields[ 73,2]='N'
lxFields[ 73,3]=  3
lxFields[ 73,4]=  0
lxFields[ 74,1]='CONTFLAG'
lxFields[ 74,2]='C'
lxFields[ 74,3]=  1
lxFields[ 74,4]=  0
lxFields[ 75,1]='DATEFLAG'
lxFields[ 75,2]='C'
lxFields[ 75,3]=  1
lxFields[ 75,4]=  0
lxFields[ 76,1]='DOWNLOAD'
lxFields[ 76,2]='C'
lxFields[ 76,3]=  1
lxFields[ 76,4]=  0
lxFields[ 77,1]='DOWNNOCONT'
lxFields[ 77,2]='N'
lxFields[ 77,3]=  3
lxFields[ 77,4]=  0
lxFields[ 78,1]='DOWNTEMP'
lxFields[ 78,2]='C'
lxFields[ 78,3]=  1
lxFields[ 78,4]=  0
lxFields[ 79,1]='DOWNUSER'
lxFields[ 79,2]='C'
lxFields[ 79,3]=  3
lxFields[ 79,4]=  0
lxFields[ 80,1]='EDITBY'
lxFields[ 80,2]='C'
lxFields[ 80,3]=  3
lxFields[ 80,4]=  0
lxFields[ 81,1]='EDITDATE'
lxFields[ 81,2]='D'
lxFields[ 81,3]=  8
lxFields[ 81,4]=  0
lxFields[ 82,1]='LCBY'
lxFields[ 82,2]='C'
lxFields[ 82,3]=  3
lxFields[ 82,4]=  0
lxFields[ 83,1]='LCON'
lxFields[ 83,2]='D'
lxFields[ 83,3]=  8
lxFields[ 83,4]=  0
lxFields[ 84,1]='LCONTYPE'
lxFields[ 84,2]='C'
lxFields[ 84,3]= 10
lxFields[ 84,4]=  0
lxFields[ 85,1]='LDOWNBY'
lxFields[ 85,2]='C'
lxFields[ 85,3]=  3
lxFields[ 85,4]=  0
lxFields[ 86,1]='LDOWNDATE'
lxFields[ 86,2]='D'
lxFields[ 86,3]=  8
lxFields[ 86,4]=  0
lxFields[ 87,1]='LOCKED'
lxFields[ 87,2]='C'
lxFields[ 87,3]=  1
lxFields[ 87,4]=  0
lxFields[ 88,1]='LOCKUSER'
lxFields[ 88,2]='C'
lxFields[ 88,3]=  3
lxFields[ 88,4]=  0
lxFields[ 89,1]='LSDATE'
lxFields[ 89,2]='D'
lxFields[ 89,3]=  8
lxFields[ 89,4]=  0
lxFields[ 90,1]='MAIL_CODES'
lxFields[ 90,2]='C'
lxFields[ 90,3]= 30
lxFields[ 90,4]=  0
lxFields[ 91,1]='MEMODATA'
lxFields[ 91,2]='C'
lxFields[ 91,3]=  1
lxFields[ 91,4]=  0
lxFields[ 92,1]='MEMOFLAG'
lxFields[ 92,2]='C'
lxFields[ 92,3]=  1
lxFields[ 92,4]=  0
lxFields[ 93,1]='MEMOINFO'
lxFields[ 93,2]='M'
lxFields[ 93,3]=  4
lxFields[ 93,4]=  0
lxFields[ 94,1]='NCONDATE'
lxFields[ 94,2]='D'
lxFields[ 94,3]=  8
lxFields[ 94,4]=  0
lxFields[ 95,1]='NCONTYPE'
lxFields[ 95,2]='C'
lxFields[ 95,3]= 10
lxFields[ 95,4]=  0
lxFields[ 96,1]='NOCONT'
lxFields[ 96,2]='N'
lxFields[ 96,3]=  3
lxFields[ 96,4]=  0
lxFields[ 97,1]='NOTES'
lxFields[ 97,2]='M'
lxFields[ 97,3]=  4
lxFields[ 97,4]=  0
lxFields[ 98,1]='NOVOWEL'
lxFields[ 98,2]='C'
lxFields[ 98,3]= 35
lxFields[ 98,4]=  0
lxFields[ 99,1]='OPENING'
lxFields[ 99,2]='C'
lxFields[ 99,3]= 30
lxFields[ 99,4]=  0
lxFields[100,1]='PH1TYPE'
lxFields[100,2]='C'
lxFields[100,3]=  9
lxFields[100,4]=  0
lxFields[101,1]='PH2TYPE'
lxFields[101,2]='C'
lxFields[101,3]=  9
lxFields[101,4]=  0
lxFields[102,1]='SALE_POT'
lxFields[102,2]='N'
lxFields[102,3]=  8
lxFields[102,4]=  2
lxFields[103,1]='WPLETNUM'
lxFields[103,2]='N'
lxFields[103,3]=  2
lxFields[103,4]=  0
lxFields[104,1]='WSRCHTAG'
lxFields[104,2]='C'
lxFields[104,3]=  1
lxFields[104,4]=  0
lxFields[105,1]='MISC1'
lxFields[105,2]='C'
lxFields[105,3]= 40
lxFields[105,4]=  0
lxFields[106,1]='MISC2'
lxFields[106,2]='C'
lxFields[106,3]= 40
lxFields[106,4]=  0
lxFields[107,1]='MISC3'
lxFields[107,2]='D'
lxFields[107,3]=  8
lxFields[107,4]=  0
lxFields[108,1]='MISC4'
lxFields[108,2]='N'
lxFields[108,3]= 10
lxFields[108,4]=  2
lxFields[109,1]='COUNTY'
lxFields[109,2]='C'
lxFields[109,3]= 15
lxFields[109,4]=  0
lxFields[110,1]='PAGER'
lxFields[110,2]='C'
lxFields[110,3]= 20
lxFields[110,4]=  0
lxFields[111,1]='EDITTIME'
lxFields[111,2]='C'
lxFields[111,3]=  8
lxFields[111,4]=  0
lxFields[112,1]='STATUS'
lxFields[112,2]='C'
lxFields[112,3]= 10
lxFields[112,4]=  0
lxFields[113,1]='USER1'
lxFields[113,2]='C'
lxFields[113,3]= 21
lxFields[113,4]=  0
lxFields[114,1]='USER10'
lxFields[114,2]='C'
lxFields[114,3]= 21
lxFields[114,4]=  0
lxFields[115,1]='USER11'
lxFields[115,2]='C'
lxFields[115,3]= 21
lxFields[115,4]=  0
lxFields[116,1]='USER12'
lxFields[116,2]='C'
lxFields[116,3]= 21
lxFields[116,4]=  0
lxFields[117,1]='USER13'
lxFields[117,2]='C'
lxFields[117,3]= 21
lxFields[117,4]=  0
lxFields[118,1]='USER14'
lxFields[118,2]='C'
lxFields[118,3]= 21
lxFields[118,4]=  0
lxFields[119,1]='USER15'
lxFields[119,2]='C'
lxFields[119,3]= 21
lxFields[119,4]=  0
lxFields[120,1]='USER16'
lxFields[120,2]='C'
lxFields[120,3]= 21
lxFields[120,4]=  0
lxFields[121,1]='USER17'
lxFields[121,2]='C'
lxFields[121,3]= 21
lxFields[121,4]=  0
lxFields[122,1]='USER18'
lxFields[122,2]='C'
lxFields[122,3]= 21
lxFields[122,4]=  0
lxFields[123,1]='USER19'
lxFields[123,2]='C'
lxFields[123,3]= 21
lxFields[123,4]=  0
lxFields[124,1]='USER2'
lxFields[124,2]='C'
lxFields[124,3]= 21
lxFields[124,4]=  0
lxFields[125,1]='USER20'
lxFields[125,2]='C'
lxFields[125,3]= 21
lxFields[125,4]=  0
lxFields[126,1]='USER21'
lxFields[126,2]='C'
lxFields[126,3]= 21
lxFields[126,4]=  0
lxFields[127,1]='USER22'
lxFields[127,2]='C'
lxFields[127,3]= 21
lxFields[127,4]=  0
lxFields[128,1]='USER23'
lxFields[128,2]='C'
lxFields[128,3]= 21
lxFields[128,4]=  0
lxFields[129,1]='USER24'
lxFields[129,2]='C'
lxFields[129,3]= 21
lxFields[129,4]=  0
lxFields[130,1]='USER25'
lxFields[130,2]='C'
lxFields[130,3]= 21
lxFields[130,4]=  0
lxFields[131,1]='USER26'
lxFields[131,2]='C'
lxFields[131,3]= 21
lxFields[131,4]=  0
lxFields[132,1]='USER27'
lxFields[132,2]='C'
lxFields[132,3]= 21
lxFields[132,4]=  0
lxFields[133,1]='USER28'
lxFields[133,2]='C'
lxFields[133,3]= 21
lxFields[133,4]=  0
lxFields[134,1]='USER29'
lxFields[134,2]='C'
lxFields[134,3]= 21
lxFields[134,4]=  0
lxFields[135,1]='USER3'
lxFields[135,2]='C'
lxFields[135,3]= 21
lxFields[135,4]=  0
lxFields[136,1]='USER30'
lxFields[136,2]='C'
lxFields[136,3]= 21
lxFields[136,4]=  0
lxFields[137,1]='USER31'
lxFields[137,2]='C'
lxFields[137,3]= 21
lxFields[137,4]=  0
lxFields[138,1]='USER32'
lxFields[138,2]='C'
lxFields[138,3]= 21
lxFields[138,4]=  0
lxFields[139,1]='USER33'
lxFields[139,2]='C'
lxFields[139,3]= 21
lxFields[139,4]=  0
lxFields[140,1]='USER34'
lxFields[140,2]='C'
lxFields[140,3]= 21
lxFields[140,4]=  0
lxFields[141,1]='USER35'
lxFields[141,2]='C'
lxFields[141,3]= 21
lxFields[141,4]=  0
lxFields[142,1]='USER36'
lxFields[142,2]='C'
lxFields[142,3]= 21
lxFields[142,4]=  0
lxFields[143,1]='USER4'
lxFields[143,2]='C'
lxFields[143,3]= 21
lxFields[143,4]=  0
lxFields[144,1]='USER5'
lxFields[144,2]='C'
lxFields[144,3]= 21
lxFields[144,4]=  0
lxFields[145,1]='USER6'
lxFields[145,2]='C'
lxFields[145,3]= 21
lxFields[145,4]=  0
lxFields[146,1]='USER7'
lxFields[146,2]='C'
lxFields[146,3]= 21
lxFields[146,4]=  0
lxFields[147,1]='USER8'
lxFields[147,2]='C'
lxFields[147,3]= 21
lxFields[147,4]=  0
lxFields[148,1]='USER9'
lxFields[148,2]='C'
lxFields[148,3]= 21
lxFields[148,4]=  0
lxFields[149,1]='MIDL_NAME'
lxFields[149,2]='C'
lxFields[149,3]= 20
lxFields[149,4]=  0
lxFields[150,1]='FIRST_NAME'
lxFields[150,2]='C'
lxFields[150,3]= 20
lxFields[150,4]=  0
lxFields[151,1]='LAST_NAME'
lxFields[151,2]='C'
lxFields[151,3]= 20
lxFields[151,4]=  0
lxFields[152,1]='USER_A'
lxFields[152,2]='C'
lxFields[152,3]= 35
lxFields[152,4]=  0
lxFields[153,1]='USER_B'
lxFields[153,2]='C'
lxFields[153,3]= 35
lxFields[153,4]=  0
lxFields[154,1]='USER_C'
lxFields[154,2]='C'
lxFields[154,3]= 35
lxFields[154,4]=  0
lxFields[155,1]='USER_D'
lxFields[155,2]='C'
lxFields[155,3]= 35
lxFields[155,4]=  0
lxFields[156,1]='USER_E'
lxFields[156,2]='M'
lxFields[156,3]=  4
lxFields[156,4]=  0
lxFields[157,1]='USER_F'
lxFields[157,2]='M'
lxFields[157,3]=  4
lxFields[157,4]=  0
lxFields[158,1]='USER_G'
lxFields[158,2]='C'
lxFields[158,3]= 35
lxFields[158,4]=  0
lxFields[159,1]='USER_H'
lxFields[159,2]='C'
lxFields[159,3]= 35
lxFields[159,4]=  0
lxFields[160,1]='USER_I'
lxFields[160,2]='C'
lxFields[160,3]= 35
lxFields[160,4]=  0
lxFields[161,1]='USER_J'
lxFields[161,2]='C'
lxFields[161,3]= 35
lxFields[161,4]=  0
lxFields[162,1]='USER_K'
lxFields[162,2]='M'
lxFields[162,3]=  4
lxFields[162,4]=  0
lxFields[163,1]='USER_L'
lxFields[163,2]='M'
lxFields[163,3]=  4
lxFields[163,4]=  0
lxFields[164,1]='WEBSITE'
lxFields[164,2]='C'
lxFields[164,3]= 60
lxFields[164,4]=  0
lxFields[165,1]='PASSWORD'
lxFields[165,2]='C'
lxFields[165,3]= 20
lxFields[165,4]=  0
lxFields[166,1]='CC_NUM'
lxFields[166,2]='C'
lxFields[166,3]= 20
lxFields[166,4]=  0
lxFields[167,1]='CC_EXP'
lxFields[167,2]='D'
lxFields[167,3]=  8
lxFields[167,4]=  0
lxFields[168,1]='CC_BILL'
lxFields[168,2]='L'
lxFields[168,3]=  1
lxFields[168,4]=  0
lxFields[169,1]='ADDRSTATE'
lxFields[169,2]='C'
lxFields[169,3]= 10
lxFields[169,4]=  0
lxFields[170,1]='CREDLIMIT'
lxFields[170,2]='Y'
lxFields[170,3]=  8
lxFields[170,4]=  4
lxFields[171,1]='URL'
lxFields[171,2]='M'
lxFields[171,3]=  4
lxFields[171,4]=  0
lxFields[172,1]='WEBCUST'
lxFields[172,2]='L'
lxFields[172,3]=  1
lxFields[172,4]=  0
lxFields[173,1]='ESHOP'
lxFields[173,2]='L'
lxFields[173,3]=  1
lxFields[173,4]=  0
lxFields[174,1]='ECRMSTAT'
lxFields[174,2]='C'
lxFields[174,3]=  1
lxFields[174,4]=  0
lxFields[175,1]='CREDSTAT'
lxFields[175,2]='C'
lxFields[175,3]=  1
lxFields[175,4]=  0
lxFields[176,1]='NLACNO'
lxFields[176,2]='C'
lxFields[176,3]=  6
lxFields[176,4]=  0
lxFields[177,1]='CUSTSTAT'
lxFields[177,2]='C'
lxFields[177,3]=  1
lxFields[177,4]=  0
lxFields[178,1]='DEPACT'
lxFields[178,2]='C'
lxFields[178,3]= 24
lxFields[178,4]=  0
lxFields[179,1]='PICKUP'
lxFields[179,2]='L'
lxFields[179,3]=  1
lxFields[179,4]=  0
lxFields[180,1]='CCNO'
lxFields[180,2]='C'
lxFields[180,3]= 19
lxFields[180,4]=  0
lxFields[181,1]='CCDATE'
lxFields[181,2]='C'
lxFields[181,3]=  5
lxFields[181,4]=  0
lxFields[182,1]='DLNO'
lxFields[182,2]='C'
lxFields[182,3]= 20
lxFields[182,4]=  0
lxFields[183,1]='DLDATE'
lxFields[183,2]='D'
lxFields[183,3]=  8
lxFields[183,4]=  0
lxFields[184,1]='STATE'
lxFields[184,2]='C'
lxFields[184,3]= 10
lxFields[184,4]=  0
lxFields[185,1]='LIMIT'
lxFields[185,2]='Y'
lxFields[185,3]=  8
lxFields[185,4]=  4
lxFields[186,1]='USEFAVS'
lxFields[186,2]='N'
lxFields[186,3]=  1
lxFields[186,4]=  0
lxFields[187,1]='STUCHK'
lxFields[187,2]='L'
lxFields[187,3]=  1
lxFields[187,4]=  0
lxFields[188,1]='TEACHECK'
lxFields[188,2]='L'
lxFields[188,3]=  1
lxFields[188,4]=  0
lxFields[189,1]='STUEXP'
lxFields[189,2]='D'
lxFields[189,3]=  8
lxFields[189,4]=  0
lxFields[190,1]='TEAEXP'
lxFields[190,2]='D'
lxFields[190,3]=  8
lxFields[190,4]=  0
lxFields[191,1]='NOTIFY'
lxFields[191,2]='L'
lxFields[191,3]=  1
lxFields[191,4]=  0
lxFields[192,1]='STAFF'
lxFields[192,2]='L'
lxFields[192,3]=  1
lxFields[192,4]=  0
lxFields[193,1]='DATEMOD'
lxFields[193,2]='T'
lxFields[193,3]=  8
lxFields[193,4]=  0
lxFields[194,1]='CUSTGEN'
lxFields[194,2]='G'
lxFields[194,3]=  4
lxFields[194,4]=  0
lxFields[195,1]='SOUND'
lxFields[195,2]='G'
lxFields[195,3]=  4
lxFields[195,4]=  0
lxFields[196,1]='IMAGE'
lxFields[196,2]='G'
lxFields[196,3]=  4
lxFields[196,4]=  0

CREATE TABLE (lcFileName) FROM ARRAY lxFields


  USE
ENDIF

ENDFUNC
* CreateTable

*************************************************************
FUNCTION Reindex()
*************************************************************

IF THIS.nDataMode = 0
   IF !OpenExclusive(THIS.cDataPath + THIS.cFileName,THIS.cAlias)
      THIS.SetError("Unable to open Customer file due to exclusive use.")
      RETURN .F.
   ENDIF

   DELETE TAG ALL
   PACK

INDEX ON upper(addcode) TAG addcode
INDEX ON adddate TAG adddate
INDEX ON upper(address1) TAG address1
INDEX ON upper(address2) TAG address2
INDEX ON addtime TAG addtime
INDEX ON alt_custno TAG alt_cust
INDEX ON currency TAG currency
INDEX ON upper(company) TAG company1
INDEX ON upper(company) TAG company2
INDEX ON phone TAG phone
INDEX ON custstat+custno TAG custstat
INDEX ON custstat TAG custsta2
INDEX ON custno TAG custno
INDEX ON left(custno,1) TAG arcust1
INDEX ON zip+custno TAG zip1
INDEX ON upper(bcode+company) TAG bcode
INDEX ON upper(carrierrt+company) TAG carrierr
INDEX ON cfreq TAG cfreq
INDEX ON upper(city+company) TAG city
INDEX ON upper(code+company) TAG code
INDEX ON upper(company) TAG company
INDEX ON upper(company) TAG compname
INDEX ON contact TAG contact
INDEX ON upper(country+company) TAG country
INDEX ON deleted() TAG deleted
INDEX ON deleted() TAG delflag
INDEX ON dlno TAG dlno
INDEX ON upper(substr(faxno,5,8)) TAG faxno
INDEX ON upper(first_name) TAG frstname
INDEX ON trim(last_name)+" "+trim(first_name)+" "+trim(midl_name) TAG fullname
INDEX ON upper(indust+company) TAG indust
INDEX ON upper(last_name) TAG lastname
INDEX ON upper(lcby+company) TAG lcby
INDEX ON lckdate TAG lckdate
INDEX ON lcktime TAG lcktime
INDEX ON lcon TAG lcon
INDEX ON locked TAG locked
INDEX ON upper(mail_codes) TAG mail_cod
INDEX ON memoflag TAG memoflag
INDEX ON upper(midl_name) TAG midlname
INDEX ON dtoc(ncondate)+upper(company) TAG nconchar
INDEX ON ncondate TAG ncondate
INDEX ON nlacno TAG nlacno
INDEX ON nocont TAG nocont
INDEX ON upper(opening) TAG opening
INDEX ON upper(ph1type+company) TAG ph1type
INDEX ON upper(ph2type+company) TAG ph2type
INDEX ON substr(phone,5,3)+substr(phone,9,4) TAG phsearch
INDEX ON upper(user19+company) TAG quick1
INDEX ON upper(user20)+company TAG quick2
INDEX ON upper(salesmn+company) TAG salesmn
INDEX ON sale_pot TAG sale_pot
INDEX ON upper(source+company) TAG source
INDEX ON upper(addrstate+company) TAG state
INDEX ON upper(terr+company) TAG terr
INDEX ON upper(title+company) TAG title
INDEX ON sys(11,ncondate)+upper(salesmn+company) TAG today
INDEX ON upper(type+company) TAG ty
INDEX ON zip+custno TAG zip
INDEX ON upper(city) TAG _city
INDEX ON upper(salesmn) TAG _salesmn


   USE
ENDIF
ENDFUNC
* Reindex

ENDDEFINE
* ccustomer
