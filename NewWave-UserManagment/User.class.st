Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'userId',
		'username',
		'password',
		'email',
		'firstname',
		'lastname'
	],
	#category : #'NewWave-UserManagment'
}

{ #category : #accessing }
User >> email [
	 ^ email
]

{ #category : #accessing }
User >> email: anEmail [
	email := anEmail 
]

{ #category : #accessing }
User >> firstname [
	^firstname 
]

{ #category : #accessing }
User >> firstname: aFristname [
	firstname := aFristname 
]

{ #category : #initialization }
User >> initialize [
	super initialize.
	
]

{ #category : #accessing }
User >> lastname [
	^lastname 
]

{ #category : #accessing }
User >> lastname: aLastname [
	lastname := aLastname 
]

{ #category : #accessing }
User >> password [ 
	^ password.
]

{ #category : #accessing }
User >> password: aPassword [
	password := aPassword 
]

{ #category : #accessing }
User >> userId [
	^ userId
]

{ #category : #accessing }
User >> userId: anUserId [
	userId := anUserId
]

{ #category : #accessing }
User >> username [ 
	^ username 
]

{ #category : #accessing }
User >> username: anUsername [
	username := anUsername
]
