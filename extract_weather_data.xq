declare function local:getCountries() as item()*
{
    for $country in doc('countries.xml')//country 
    where doc('data.xml')//item/city/country = $country/@alpha-2
    order by $country/@name
    return  <country alpha-2="{$country/@alpha-2}">
                <name>{data($country/@name)}</name>
                <cities>
                        {
                            for $item in doc('data.xml')//item[./city/country = $country/@alpha-2]
                                return <city>
                                            <name>{data($item/city/@name)}</name>
                                            <temperature unit="{$item/temperature/@unit}">{data($item/temperature/@value)}</temperature>
                                            <feels_like unit="{$item/feels_like/@unit}">{data($item/feels_like/@value)}</feels_like>
                                            <humidity unit="{$item/humidity/@unit}">{data($item/humidity/@value)}</humidity>
                                            <pressure unit="{$item/pressure/@unit}">{data($item/pressure/@value)}</pressure>
                                            <clouds>{data($item/clouds/@name)}</clouds>
                                            <weather icon="{$item/weather/@icon}">{data($item/weather/@value)}</weather>
                                        </city>
                        }
                </cities>
            </country> 
};

<results xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="weather_data.xsd">
{
    let $errorTag := doc('data.xml')//*[ contains( lower-case(name()), 'error' ) ]
    return if ( count($errorTag) eq 0 )
           then local:getCountries()
           else <error> Error code {data($errorTag/cod)}: {data($errorTag/message)} </error>
}
</results>
