Extension { #name : #WaveEngine }

{ #category : #'*NewWave-UserManagment' }
WaveEngine >> loadUserManagement [  
		(pluginData includesKey: #LoadUserManagement) ifTrue:  [ 
				^ pluginData at: #LoadUserManagement.
			 ] 
		ifFalse: [ 
				^ nil.
			 ]
		
]

{ #category : #'*NewWave-UserManagment' }
WaveEngine >> loadUsersAndGroups [
	pluginData
		at: #LoadUserManagement
		put: (LoadUserManagement waveEngine: self 	
			  						   pathToUsers:'C:\Users\Nemanja\Desktop\PHARO-BACKUP\users.json'
										pathToGroups: 'C:\Users\Nemanja\Desktop\PHARO-BACKUP\groups.json'
										pathToMemberships: 'C:\Users\Nemanja\Desktop\PHARO-BACKUP\membership.json'
										).
]
