/**
 * Atlaskit Prepare Component Script.
 *
 * Boostrap given package and build all it's dependencies.
 *
 * Example:
 *    $ akpc editor-core
 */
extern crate rustc_serialize;
use std::env;
use std::fs::File;
use std::path::Path;
use std::io::Read;
use rustc_serialize::json::Json;

fn get_package_name() -> String {
    if let Some(package) = env::args().nth(1) {
        return package;
    }

    return "".to_string()
}

fn get_package_json(package_name: &String) -> Json {
    let path = Path::new("packages").join(&package_name).join("package__.json");
    let mut data = String::new();
    match File::open(path.into_os_string()) {
        Ok(mut file) => {
            file.read_to_string(&mut data).unwrap();
            return Json::from_str(&data).unwrap();
        },
        Err(_) => return Json::from_str("null").unwrap(),
    }
}

fn main() {
    let package_name: String = get_package_name();

    if package_name == "".to_string() {
        panic!("Package name is requried!");
    }

    println!("{:?}", env::current_dir());

    let package_json: Json = get_package_json(&package_name);

    println!("{}", package_json.is_null());
}
