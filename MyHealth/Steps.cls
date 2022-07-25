Class MyHealth.Steps Extends %Persistent
{

Property Steps As %Numeric;

Property RecordDate As %Date;

/// 2022年5月～7月分でデータ作る
ClassMethod create()
{
	do ..%KillExtent()
	for month=5:1:7 {
		set start=$ZDATEH("2022-"_month_"-01",3)-1
		set end=$select(month=6:30,1:31)
		for i=1:1:end {
			set obj=..%New()
			set obj.Steps=$Random(10000)
			set obj.RecordDate=start+i
			set st=obj.%Save()
		}
	}
}

/// 2022年5月～7月分でデータ作る
/// ^MySteps(YYYY,MM,DD)=歩数
ClassMethod createGlobal()
{
	kill ^MySteps
	for month=5:1:7 {
		set start=$ZDATEH("2022-"_month_"-01",3)-1
		set end=$select(month=6:30,1:31)

		for i=1:1:end {
			set dateh=start+i
			set date=$zdate(dateh,3)
			set ^MySteps($piece(date,"-"),$number($piece(date,"-",2)),$number($piece(date,"-",3)))=$Random(10000)
		}

	}
}

Storage Default
{
<Data name="StepsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Steps</Value>
</Value>
<Value name="3">
<Value>RecordDate</Value>
</Value>
</Data>
<DataLocation>^MyHealth.StepsD</DataLocation>
<DefaultData>StepsDefaultData</DefaultData>
<ExtentSize>20</ExtentSize>
<IdLocation>^MyHealth.StepsD</IdLocation>
<IndexLocation>^MyHealth.StepsI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb("1","2","4","6","8","10","11","12","13","14","15","16","17","18","19","20"),$lb(0,0,0,0,0,1,1,1,1,1,1,1,1,1,0),$lb(822083584,822083584,838860800,838860800,872415232,872415232,905969664,905969664,939524096,939524096,825229312,805306368,822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,939524096,956301312,825819136,842006528,842006528))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="RecordDate">
<AverageFieldSize>5</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(66111,66112,66114,66116,66118,66120,66121,66122,66123,66124,66125,66126,66127,66128,66129,66130),$lb(4,4,4,4,3,4,4,4,4,4,4,4,4,4,3),$lb(909521201,822083584,838860800,838860800,872415232,872415232,905969664,905969664,939524096,825753600,842006528,805306368,822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,889192448,889192448,905969664,905969664,922746880,922746880,939524096,939524096,956301312,842596352,858783744,909521203))</Histogram>
<Selectivity>5.0000%</Selectivity>
</Property>
<Property name="Steps">
<AverageFieldSize>3.95</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(221,395,1025,1741,2665,5582,5891,6356,6999,7891,8050,8167,8264,8428,9375,9857),$lb(0,0,1,0,0,1,0,1,0,0,1,1,1,0,1),$lb(842150144,842150144,859387136,859387136,825242165,808596736,926167296,825701425,842413621,842413621,892680242,892875264,943272192,892877105,909325622,859125248,960051456,909719865,926431537,926431537,942683440,808792064,825636608,825636608,842413056,842413056,875706368,942944824,959657781,859256064,943011584,959984951))</Histogram>
<Selectivity>5.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^MyHealth.StepsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
