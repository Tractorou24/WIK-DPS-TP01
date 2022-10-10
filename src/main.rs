mod request_headers;

#[macro_use]
extern crate rocket;

use request_headers::request_headers::RequestHeaders;
use rocket::serde::json::serde_json::{self, json};

#[catch(404)]
fn not_found() -> String {
    "".to_string()
}

#[launch]
fn rocket() -> _ {
    let port: i32 = match std::env::var("PING_LISTEN_PORT") {
        Ok(val) => val.parse().unwrap(),
        Err(_e) => 8080,
    };

    let config = rocket::Config::figment().merge(("port", port));
    rocket::custom(config)
        .mount("/", routes![ping])
        .register("/", catchers![not_found])
}

#[get("/ping")]
fn ping(headers: RequestHeaders) -> serde_json::Value {
    let mut res: serde_json::Value = json!({});
    for header in headers.0.iter() {
        let k = header.name().as_str().to_owned();
        let v = String::from_utf8_lossy(header.value().as_bytes()).into_owned();

        if v.contains(",") {
            let v: Vec<&str> = v
                .split(",")
                .collect::<Vec<&str>>()
                .iter()
                .map(|s| s.trim())
                .collect();
            res.as_object_mut().unwrap().insert(k, json!(v));
        } else {
            res.as_object_mut().unwrap().insert(k, json!(v));
        }
    }
    res
}
