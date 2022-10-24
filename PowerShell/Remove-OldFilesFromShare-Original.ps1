
$shareName = "share143"
$accountName = "vukistroagetest143"
$key = "LBrHZK4bAQO4vXSQmEuLZ1pqHrFn5OuoeEL6rMOK1KysQM4fnvCBJ3KCqIp3Gz9PnOqaFkTDIXtb+AStkVpWtw=="

$ctx = New-AzStorageContext -StorageAccountName $accountName -StorageAccountKey $key

        
  $DirIndex = 0
  $dirsToList = New-Object System.Collections.Generic.List[System.Object]
        
  # Get share root Dir
  $shareroot = Get-AzStorageFile -ShareName $shareName -Path . -context $ctx 
  $dirsToList += $shareroot 
        
  # List files recursively and remove file older than 30 days 
  While ($dirsToList.Count -gt $DirIndex)
  {
      $dir = $dirsToList[$DirIndex]
      $DirIndex ++
      $fileListItems = $dir | Get-AzStorageFile
      $dirsListOut = $fileListItems | where {$_.GetType().Name -eq "AzureStorageFileDirectory"}
      $dirsToList += $dirsListOut
      $files = $fileListItems | where {$_.GetType().Name -eq "AzureStorageFile"}
      
      
      if ($files.Count -gt 0) {

        Write-Host "Files in $($dir.Name)"

      } else {
        write "$($dir.Name) is empty"
      }

    }


      foreach($file in $files)
      {
          # Fetch Attributes of each file and output
          $task = $file.CloudFile.FetchAttributesAsync()
          $task.Wait()
        
          # remove file if it's older than 30 days.
          if ($file.CloudFile.Properties.LastModified -lt (Get-Date).AddDays(-30))
          {
              ## print the file LMT
              # $file | Select @{ Name = "Uri"; Expression = { $_.CloudFile.SnapshotQualifiedUri} }, @{ Name = "LastModified"; Expression = { $_.CloudFile.Properties.LastModified } } 
        
              # remove file
              $file | Remove-AzStorageFile
          }
      }
      #Debug log
      # Write-Host  $DirIndex $dirsToList.Length  $dir.CloudFileDirectory.SnapshotQualifiedUri.ToString() 
  }


  the powershell way would be to enumarate files and find if the of files -gt 0, and then delete the share.

  However, we can also


