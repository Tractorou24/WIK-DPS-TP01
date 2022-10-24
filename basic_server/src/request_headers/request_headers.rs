use rocket::{
    http::HeaderMap,
    outcome::Outcome,
    request::{self, FromRequest},
    Request,
};
use std::convert::Infallible;

pub struct RequestHeaders<'h>(pub &'h HeaderMap<'h>);
#[rocket::async_trait]
impl<'r> FromRequest<'r> for RequestHeaders<'r> {
    type Error = Infallible;

    async fn from_request(request: &'r Request<'_>) -> request::Outcome<Self, Self::Error> {
        let request_headers = request.headers();
        Outcome::Success(RequestHeaders(request_headers))
    }
}
