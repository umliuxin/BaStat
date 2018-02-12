# Team info
TEAM_NAME = '老司机'
TEAM_LOGO_URL = 'logo-mixed.png'
STADIUM_ADDRESS = '2800, Interstate 280, Los Altos Hills, CA 94022'
TEAM_OPPO_LOGO_DEFAULT = 'logo-oppo.png'
PLAYER_DEFAULT_IMAGE = 'player-default.png'

DEFERRED_ASSET_NAMES = {
  design: 'design_guide',
  team_page: 'application'
}

DEFAULT_DEFERRED_ASSET_NAME = 'application'

# Position Array
POSITION_SHORT_NAME = {
  Center: 'C',
  Forward: 'F',
  Guard: 'G'
}

# Game Type
GAME_TYPE_SCHEDULE = 'schedule'
GAME_TYPE_RESULT = 'result'
GAME_TYPE_UNTRACK = 'untrack'

# Game Action List:
GAME_ACTION_LIST = [
  {key: 'Q', keyindex: 81 ,name: '2PT_MADE'},
  {key: 'W', keyindex: 87 ,name: '2PT_MISS'},
  {key: 'E', keyindex: 69 ,name: '3PT_MADE'},
  {key: 'R', keyindex: 82 ,name: '3PT_MISS'},
  {key: 'Z', keyindex: 90 ,name: 'FT_MADE'},
  {key: 'X', keyindex: 88 ,name: 'FT_MISS'},
  {key: 'C', keyindex: 67 ,name: 'PUTBACK_MADE'},
  {key: 'V', keyindex: 86 ,name: 'PUTBACK_MISS'},
  {key: 'A', keyindex: 65 ,name: 'ASSIST'},
  {key: 'O', keyindex: 79 ,name: 'OFF_REB'},
  {key: 'D', keyindex: 68 ,name: 'DEF_REB'},
  {key: 'S', keyindex: 83 ,name: 'STEAL'},
  {key: 'F', keyindex: 70 ,name: 'FOUL'},
  {key: 'T', keyindex: 84 ,name: 'TURNOVER'},
  {key: 'B', keyindex: 66 ,name: 'BLOCK'},
]

# team and oppo team
TEAM_ID = 0
# TEAM_NAME ='Team'
OPPO_TEAM_ID = -1
OPPO_NAME = 'Opponent'
NULL_PLAYER_ID = -2
QUARTER_END_ACTION_INDEX = 15

#Quarter
GAME_END_INDEX = 5
GAME_END_TEXT = 'END OF GAME'.freeze

# Position move
POSITION_MOVE = {
  moveup: 'MOVE UP',
  movedown: 'MOVE DOWN'
}

# OPPO TEAM NAME AND logo-mixed
OPPO_TEAM_ARR = [
  { name:'Blue Archer', logo: 'BlueArcher.jpg', shortname:'BLU'},
  { name:'BOBA Boys', logo:'', shortname:'BOB'},
  { name:'Bravo', logo:'Bravo.jpg', shortname:'BRA'},
  { name:'Broncos', logo:'Broncos.jpg', shortname:'BRO'},
  { name:'Captain No Shoot', logo:'CaptainNoShot.jpg', shortname:'CNS'},
  { name:'Goat', logo:'Goat.jpg', shortname:'GOA'},
  { name:'ILG', logo:'ILG.jpg', shortname:'ILG'},
  { name:'Jade Dragon', logo:'JadeDragon.png', shortname:'JAD'},
  { name:'Madness', logo:'', shortname:'MAD'},
  { name:'MLB', logo:'MLB.jpg', shortname:'MLB'},
  { name:'NK Infernal', logo:'', shortname:'INF'},
  { name:'OLD MENs HOPE', logo:'', shortname:'OMH'},
  { name:'Pandas', logo:'Pandas.png', shortname:'PAN'},
  { name:'Pegasi', logo:'Pegasi.gif', shortname:'PEG'},
  { name:'Snow City', logo:'', shortname:'SNC'},
  { name:'Splash City', logo:'', shortname:'SPC'},
  { name:'The Cereal Killers', logo:'', shortname:'CEK'},
  { name:'THUrsday', logo:'THUrsday.png', shortname:'THU'},
  { name:'TITANS', logo:'', shortname:'TIT'},
  { name:'Trust the Process', logo:'TrustTheProcss.JPG', shortname:'TRP'},
  { name:'WACH', logo:'Wach.png', shortname:'WAC'},
  { name:'WILD SPIRIT 野', logo:'WildSpirit.png', shortname:'WIS'},
  { name:'Wolfpack', logo:'Wolfpack.jpg', shortname:'WOL'},
  { name:'人民币', logo:'RMB.jpg', shortname:'RMB'},
  { name:'西南某队', logo:'Xinan.jpg', shortname:'XNM'},
  { name:'达快速递', logo:'DaDa.jpg', shortname:'DKS'},
  { name:'TBD', logo:'', shortname: 'TBD'}
]

VIDEO_TEAM_LIST = [
  {"name":"恒星","id":0,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010091/75/75/c/1504847607.jpg"},
  {"name":"Blue Archer","id":1,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1007392/75/75/c/1452471589.jpg"},
  {"name":"Broncos","id":2,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1009107/75/75/c/1485128502.jpeg"},
  {"name":"Captain No Shoot","id":3,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1008321/75/75/c/1467263364.jpg"},
  {"name":"Dragons","id":4,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010219/75/75/c/1504759903.png"},
  {"name":"Goat","id":5,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1008323/75/75/c/1467331673.jpg"},
  {"name":"ILG","id":6,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1003010/75/75/c/1441188936.jpg"},
  {"name":"MLB","id":7,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1008291/75/75/c/1466900917.jpg"},
  {"name":"NK Infernal","id":8,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1007002/75/75/c/1504763562.jpg"},
  {"name":"OmniVision","id":9,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010089/75/75/c/1504762386.JPG"},
  {"name":"Pandas","id":10,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010218/75/75/c/1504763785.png"},
  {"name":"Pegasi","id":11,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1008328/75/75/c/1470085399.gif"},
  {"name":"Splash City","id":12,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1008452/75/75/c/1504849500.jpg"},
  {"name":"Team All-in","id":13,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010093/75/75/c/1501906122.jpg"},
  {"name":"BOBA","id":14,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1007474/75/75/c/1489818868.JPG"},
  {"name":"The Cereal Killers","id":15,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1009106/75/75/c/1504847733.jpg"},
  {"name":"THUrsday","id":16,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1007008/75/75/c/1458540318.png"},
  {"name":"TITANS","id":17,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1006994/75/75/c/1504763698.png"},
  {"name":"ToT","id":18,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010105/75/75/c/1502673753.jpg"},
  {"name":"Trust the Process","id":19,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1009102/75/75/c/1487137168.JPG"},
  {"name":"VIPERS","id":20,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010092/75/75/c/1504763451.png"},
  {"name":"WACH","id":21,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010157/75/75/c/1503276675.jpg"},
  {"name":"Wolfpack","id":22,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1008289/75/75/c/1466884659.jpg"},
  {"name":"人民币","id":23,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1004715/75/75/c/1441188791.jpg"},
  {"name":"江湖","id":24,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010072/75/75/c/1502749364.png"},
  {"name":"老司机","id":25,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/905734/75/75/c/1441189061.jpg"},
  {"name":"西南某队","id":26,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1008331/75/75/c/1467051767.jpg"},
  {"name":"野","id":27,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010212/75/75/c/1504849791.png"},
  {"name":"Pretty Women","id":28,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010214/75/75/c/1504429374.jpg"},
  {"name":"老A战队","id":29,"image":"http://a.espncdn.com/combiner/i?img=/redesign/assets/img/icons/ESPN-icon-basketball.png&w=288&h=288&transparent=true"},
  {"name":"蓝鲸队","id":30,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010216/75/75/c/1504760864.jpg"},
  {"name":"辣妈天团","id":31,"image":"http://d31217d8r00rg3.cloudfront.net/thumb/team/logo/1010213/75/75/c/1504415654.jpg"}
]
