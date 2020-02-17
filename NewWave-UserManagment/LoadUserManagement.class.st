Class {
	#name : #LoadUserManagement,
	#superclass : #Object,
	#instVars : [
		'groups',
		'users',
		'engine',
		'pathToUsers',
		'pathToGroups',
		'memberships'
	],
	#category : #'NewWave-UserManagment'
}

{ #category : #'as yet unclassified' }
LoadUserManagement class >> waveEngine: aWaveEngine pathToUsers: aPathToUsers pathToGroups: aPathToGroups [ 
	^ self new  
		initializeEngine: aWaveEngine pathToGroups: aPathToGroups pathToUsers: aPathToUsers;
		yourself.
	
]

{ #category : #'as yet unclassified' }
LoadUserManagement class >> waveEngine: aWaveEngine pathToUsers: aPathToUsers pathToGroups: aPathToGroups pathToMemberships: aPathToMembership [
	^ self new  
		initializeEngine: aWaveEngine pathToGroups: aPathToGroups pathToUsers: aPathToUsers pathToMemberships: aPathToMembership;
		yourself.
	
]

{ #category : #adding }
LoadUserManagement >> addGroup: aGroup [
	groups add: aGroup.
]

{ #category : #adding }
LoadUserManagement >> addMembership: aMembership [
	memberships  add: aMembership.
]

{ #category : #adding }
LoadUserManagement >> addUser: anUser [
	users add: anUser 
]

{ #category : #accessing }
LoadUserManagement >> engine [ 
	^ engine .
	
]

{ #category : #accessing }
LoadUserManagement >> engine: aWaveEngine [
	engine := aWaveEngine 
]

{ #category : #'as yet unclassified' }
LoadUserManagement >> findGroup: aGroupId [
	^ groups  select: [ :each | each groupId = aGroupId  ]
]

{ #category : #'as yet unclassified' }
LoadUserManagement >> findUser: anUserId [
	^ users  select: [ :each | each userId = anUserId ]
]

{ #category : #accessing }
LoadUserManagement >> groups [ 	
	^ groups
]

{ #category : #initialization }
LoadUserManagement >> initialize [
	super initialize.
	users := OrderedCollection new.
	groups := OrderedCollection new.
	memberships := OrderedCollection new.
]

{ #category : #initialization }
LoadUserManagement >> initializeEngine: anEngine pathToGroups: aPathToGroups pathToUsers: aPathToUsers pathToMemberships: aPathToMembership [
	self initialize.
	users:= self loadUsers: aPathToUsers.
	groups:= self loadGroups: aPathToGroups.
	memberships:= self loadMemberships: aPathToMembership.
	engine:= anEngine.  
]

{ #category : #'as yet unclassified' }
LoadUserManagement >> loadGroups: pathToFile [
	^pathToFile asFileReference
	readStreamDo: [ :readStream |
		(NeoJSONReader on: readStream)
		listClass: OrderedCollection;
		for: #ArrayOfGroups
			customDo: [ :mapping | mapping listOfElementSchema: Group ];
		 nextAs: #ArrayOfGroups ].
]

{ #category : #'as yet unclassified' }
LoadUserManagement >> loadMemberships: pathToMemberships [
	^ pathToMemberships asFileReference
	readStreamDo: [ :readStream |
		(NeoJSONReader on: readStream)
		mapInstVarsFor: Membership ;
		listClass: OrderedCollection;
		for: #OrderedCollectionOfMembership
			customDo: [ :mapping | mapping listOfElementSchema: Membership ];
		 nextAs: #OrderedCollectionOfMembership ].
]

{ #category : #'as yet unclassified' }
LoadUserManagement >> loadUsers: pathToFile [
	^ pathToFile asFileReference
	readStreamDo: [ :readStream |
		(NeoJSONReader on: readStream)
		mapInstVarsFor: User;
		listClass: OrderedCollection;
		for: #ArrayOfUsers
			customDo: [ :mapping | mapping listOfElementSchema: User ];
		 nextAs: #ArrayOfUsers ].	
]

{ #category : #accessing }
LoadUserManagement >> memberships [
	^ memberships 
]

{ #category : #accessing }
LoadUserManagement >> pathToGroups [
	^ pathToGroups.
]

{ #category : #accessing }
LoadUserManagement >> pathToGroups: aPathToGroups [
	pathToGroups:= aPathToGroups
]

{ #category : #accessing }
LoadUserManagement >> pathToUsers [
	^ pathToUsers.
]

{ #category : #accessing }
LoadUserManagement >> pathToUsers: aPathToUsers [
	pathToUsers:= aPathToUsers
]

{ #category : #accessing }
LoadUserManagement >> users [ 
	^ users  
]
