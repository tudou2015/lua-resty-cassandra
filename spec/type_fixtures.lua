local cassandra = require "cassandra"

return {
  {name='ascii', value='string'},
  {name='ascii', insert_value=cassandra.null, read_value=nil},
  {name='bigint', insert_value=cassandra.bigint(42000000000), read_value=42000000000},
  {name='bigint', insert_value=cassandra.bigint(-42000000000), read_value=-42000000000},
  {name='bigint', insert_value=cassandra.bigint(-42), read_value=-42},
  {name='blob', value="\005\042"},
  {name='blob', value=string.rep("blob", 10000)},
  {name='boolean', value=true},
  {name='boolean', value=false},
  -- counters are not here because they are used with UPDATE instead of INSERT
  -- todo: decimal,
  {name='double', insert_value=cassandra.double(1.0000000000000004), read_test=function(value) return math.abs(value - 1.0000000000000004) < 0.000000000000001 end},
  {name='double', insert_value=cassandra.double(-1.0000000000000004), read_value=-1.0000000000000004},
  {name='double', insert_value=cassandra.double(0), read_test=function(value) return math.abs(value - 0) < 0.000000000000001 end},
  {name='double', insert_value=cassandra.double(314151), read_test=function(value) return math.abs(value - 314151) < 0.000000000000001 end},
  {name='float', insert_value=3.14151, read_test=function(value) return math.abs(value - 3.14151) < 0.0000001 end},
  {name='float', insert_value=cassandra.float(3.14151), read_test=function(value) return math.abs(value - 3.14151) < 0.0000001 end},
  {name='float', insert_value=cassandra.float(0), read_test=function(value) return math.abs(value - 0) < 0.0000001 end},
  {name='float', insert_value=-3.14151, read_test=function(value) return math.abs(value + 3.14151) < 0.0000001 end},
  {name='float', insert_value=cassandra.float(314151), read_test=function(value) return math.abs(value - 314151) < 0.0000001 end},
  {name='int', value=4200},
  {name='int', value=-42},
  {name='text', value='string'},
  {name='timestamp', insert_value=cassandra.timestamp(1405356926), read_value=1405356926},
  {name='uuid', insert_value=cassandra.uuid("1144bada-852c-11e3-89fb-e0b9a54a6d11"), read_value="1144bada-852c-11e3-89fb-e0b9a54a6d11"},
  {name='varchar', value='string'},
  {name='blob', value=string.rep("string", 10000)},
  {name='varint', value=4200},
  {name='varint', value=-42},
  {name='timeuuid', insert_value=cassandra.uuid("1144bada-852c-11e3-89fb-e0b9a54a6d11"), read_value="1144bada-852c-11e3-89fb-e0b9a54a6d11"},
  {name='inet', insert_value=cassandra.inet("127.0.0.1"), read_value="127.0.0.1"},
  {name='inet', insert_value=cassandra.inet("2001:0db8:85a3:0042:1000:8a2e:0370:7334"), read_value="2001:0db8:85a3:0042:1000:8a2e:0370:7334"},
  {name='list<text>', insert_value=cassandra.list({'abc', 'def'}), read_value={'abc', 'def'}},
  {name='list<int>', insert_value=cassandra.list({4, 2, 7}), read_value={4, 2, 7}},
  {name='map<text,text>', insert_value=cassandra.map({k1='v1', k2='v2'}), read_value={k1='v1', k2='v2'}},
  {name='map<text,int>', insert_value=cassandra.map({k1=3, k2=4}), read_value={k1=3, k2=4}},
  {name='map<text,text>', insert_value=cassandra.map({}), read_value=nil},
  {name='set<text>', insert_value=cassandra.set({'abc', 'def'}), read_value={'abc', 'def'}}
}
