# README

## Open Endpoints

Open endpoints require no Authentication.

- [Login] : `POST /api/v1/auth/login`

## Endpoints that require Authentication

Closed endpoints require a valid Token to be included in the header of the
request. A Token can be acquired from the Login view above.

### User related

- [Get An User] : `GET /api/v1/users/:id`
- [Get Users] : `GET /api/v1/users`
- [Create User] : `POST /api/v1/users`
- [Update An User] : `PUT /api/v1/users/:id`
- [Deleta An User] : `DELETE /api/v1/users/:id`
- [Get Appointment Made By User] : `GET /api/v1/users/:user_id/appointments`

### Participant related

- [Get A Participant] : `GET /api/v1/participants/:id`
- [Get Participants] : `Get /api/v1/participants`
- [Create Participant] : `POST /api/v1/participants`
- [Update An Participant] : `PUT /api/v1/participants/:id:`
- [Delete An Participant] : `DELETE /api/v1/participants/:id`
- [Search Participant] : `Get /api/v1/participants/search?query=:keyword`
- [Get Participant's Events] : `GET /api/v1/participants/:participant_id/events`

### Event related

- [Get An Event] : `GET /api/v1/events/:id`
- [Get Events] : `Get /api/v1/events`
- [Create Event] : `POST /api/v1/events`
- [Update An Event] : `PUT /api/v1/events/:id:`
- [Delete An Event] : `DELETE /api/v1/events/:id`
- [Search Event] : `Get /api/v1/events/search?query=:keyword`
- [Get Event's Participants] : `GET /api/v1/events/:event_id/participants`
