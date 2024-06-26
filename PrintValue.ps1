function PrintValue(){
    param($type,$value)
    # PropertyItem.Type プロパティ (System.Drawing.Imaging) | Microsoft Learn 
    # https://learn.microsoft.com/ja-jp/dotnet/api/system.drawing.imaging.propertyitem.type?view=netframework-4.8#system-drawing-imaging-propertyitem-type
    #
    #Write-Host ("Type=$type Value=$value")
    switch($type){
        <#
        1{
            # Byte Array
            $ret=$value
        }
        #>
        2{
            # ASCII String
            $ret="`""+[System.Text.Encoding]::ASCII.getstring($value)+"`""
        }
        3{
            # unsigined Short 16bit int
            $x=[System.BitConverter]::ToUInt16($value+@(0,0,0,0),0)
            if($x -gt 10) {
                $ret="$x(0x$($x.toString("X4")))"
            } else {
                $ret=$x
            }
            
        }
        4{
            # unsigned Long 32bit int
            $x=[System.BitConverter]::ToUInt32($value+@(0,0,0,0),0)
            if($x -gt 10) {
                $ret="$x(0x$($x.toString("X8")))"
            } else {
                $ret=$x
            }

        }
        5{
            # Unsigned Long Fraction (1st Long)/(2nd Long)
            $numerator=[System.BitConverter]::ToUInt32($value,0)
            $denominator=[System.BitConverter]::ToUInt32($value,4)
            $ret="$numerator/$denominator"
        }
        <#
        6{
            # Unknown Type Byte array
            $ret=$value
        }
        #>
        7{
            # Signed Long 32bit int 
            $x=[System.BitConverter]::ToInt32($value+@(0,0,0,0),0)
            if($x -gt 10) {
                $ret="$x(0x$($x.toString("X8")))"
            } else {
                $ret=$x
            }

        }
        10{
            # Signed Long Fraction (1st Long)/(2nd Long)
            $numerator=[System.BitConverter]::ToInt32($value,0)
            $denominator=[System.BitConverter]::ToInt32($value,4)
            $ret="$numerator/$denominator"
        }
        default {
            if($value.Count -lt 10){
            $ret=$value
            } else {
            $ret="Count=$($value.Count):$value"
            }

        }
    }
    return $ret
}