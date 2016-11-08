open Lwt
open Cohttp
open Cohttp_lwt_unix


let query artist =
	let open Bandsintown_j in 
	Client.get (Uri.of_string
	  ("http://api.bandsintown.com/artists/" ^ artist ^ ".json?api_version=2.0&app_id=mybitapp"))
	>>= fun (_, body) -> Cohttp_lwt_body.to_string body
	>>= fun s -> return (string_of_artist (artist_of_string s))

let make_server () =
	let callback conn_id req body =
	let uri = Request.uri req in
	match Re_str.(split_delim (regexp_string "/") (Uri.path uri)) with
		| ""::"artist"::artist::_ -> query artist >>= fun json -> let headers = Header.init_with "content-type" "application/json; charset=utf-8" in 
		Server.respond_string ~headers ~status:`OK ~body:json ()
     	| _ -> Server.respond_string ~status:`Not_found ~body:"Route not found" ()
    in
    Server.create (Server.make ~callback ())

let _ =
  Lwt_unix.run (make_server ())