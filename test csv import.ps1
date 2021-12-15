Function Get-FileName($InitialDirectory)
    {
        [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

      $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
      $OpenFileDialog.initialDirectory = $initialDirectory
      $OpenFileDialog.filter = "CSV (*.csv) | *.csv"
      $OpenFileDialog.ShowDialog() | Out-Null
    }

    $csvfile = Get-FileName $OpenFileDialog.FileName

Import-Csv $csvfile -Delimiter "," | select $row{0}  
