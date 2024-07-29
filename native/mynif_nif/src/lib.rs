use rustler::{Env, Term};
use log::error;

fn load(env: Env, _: Term) -> bool {
    if let Err(err) = gst::init() {
        error!("{err}");
        return false;
    }
    true
}

#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}

rustler::init!(
    "Elixir.MyNIF.NIF",
    [
        add
    ],
    load = load
);
