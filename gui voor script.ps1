#input (word alemaal in variabele gestoken)

    #vraagt om de Computer host naam in te geven
    [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
    $computer = [Microsoft.VisualBasic.Interaction]::InputBox("Geef de serverComputerName op.", "Computer")

    #vraagt om de Dns zone naam in te geven
    [System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
    $Dns = [Microsoft.VisualBasic.Interaction]::InputBox("Geef de Zonename op.", "Dns")

    #vraagt om de CSV file in te geven
    [Microsoft.VisualBasic.Interaction]::MsgBox("geef het CSV bestand op")

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog -Property @{
    initialDirectory = [environment]::GetFolderPath("Desktop")
    filter = "CSV (*.csv) | *.csv"
    }
    $OpenFileDialog.ShowDialog() 
    $csvfile =  $OpenFileDialog.FileName
    
      Import-Csv -path "$csvfile" | foreach{Add-DnsServerResourceRecordCName  -zonename $Dns -computername $computer -cname $_.cname -RRtype A}
      $ailias = "$row{0}"
      $naam = "$row{1}"
      select-Object "$ailias,$naam"
        Foreach ($row in $csv) {
        if (item in $naam -eq "" ) {print = "er is een of meerdere blanko in de naam collom"
          }
        }