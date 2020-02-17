Extension { #name : #NWCustomTaskEventBehavior }

{ #category : #'*NewWave-UserManagment' }
NWCustomTaskEventBehavior >> isUserAssigned: anAssignedUser plugin: loadUserManagment [
	^ loadUserManagment findUser: anAssignedUser.
]
