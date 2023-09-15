extern crate libc;

use libc::c_char;
use names::Generator;
use std::ffi::CString;

#[no_mangle]
pub extern fn rust_generate_name() -> *mut c_char {
    let mut generator = Generator::default();
    let c_str_name = CString::new(generator.next().unwrap()).unwrap();
    return c_str_name.into_raw();
}
