import decode from "jwt-decode";
import auth0 from "auth0-js";
import Router from "vue-router";


const ID_TOKEN_KEY = "id_token";
const ACCESS_TOKEN_KEY = "access_token";
const CLIENT_ID = "zwEKiFrqEmgw4QZ4QjfMQZshLeJ6kp8j";
const CLIENT_DOMAIN = "dev-ossvsd9s.eu.auth0.com";
const REDIRECT = "http://localhost:80/callback";
const SCOPE = "full_access";
const AUDIENCE = "http://portfolio.com";

const auth = new auth0.WebAuth({
    clientID: CLIENT_ID,
    domain: CLIENT_DOMAIN
});

 export function login() {
     auth.authorize({
         responseType: "token id_token",
         redirectUri: REDIRECT,
         audience: AUDIENCE,
         scope: SCOPE
     });
 }

const router = new Router({
    mode: "history"
});
 export function logout() {
     clearIdToken();
     clearAccessToken();
    // @ts-ignore
     router.go("/");
 }

export function getAccessToken() {
    return localStorage.getItem(ACCESS_TOKEN_KEY);
}
export function getIdToken() {
    return localStorage.getItem(ID_TOKEN_KEY);
}
function clearIdToken() {
    localStorage.removeItem(ID_TOKEN_KEY);
}
function clearAccessToken() {
    localStorage.removeItem(ACCESS_TOKEN_KEY);
}
// Helper function that will allow us to extract the access_token and id_token
function getParameterByName(name) {
    const match = RegExp("[#&]" + name + "=([^&]*)").exec(window.location.hash);
    return match && decodeURIComponent(match[1].replace(/\+/g, " "));
}
// Get and store access_token in local storage
export function setAccessToken() {
    const accessToken = getParameterByName("access_token");
    localStorage.setItem(ACCESS_TOKEN_KEY, accessToken);
}
// Get and store id_token in local storage
export function setIdToken() {
    const idToken = getParameterByName("id_token");
    localStorage.setItem(ID_TOKEN_KEY, idToken);
}
 export function isLoggedIn() {
     const idToken = getIdToken();
     return !!idToken && !isTokenExpired(idToken);
 }

function getTokenExpirationDate(encodedToken) {
    const token = decode(encodedToken);
    // @ts-ignore
    if (!token.exp) {
        return null;
    }
    const date = new Date(0);
    // @ts-ignore
    date.setUTCSeconds(token.exp);
    return date;
}
function isTokenExpired(token) {
    const expirationDate = getTokenExpirationDate(token);
    // @ts-ignore
    return expirationDate < new Date();
}
