<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wonie' );

/** Database password */
define( 'DB_PASSWORD', '0000' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '?cgBe14/=VQYFXZ%xittI@|YeW^`!^sO+Io_y$A|+5w9@)i6DV}<NntPF8;TP,aN' );
define( 'SECURE_AUTH_KEY',   '!34;ddb*@+L)F,kvT;C xL=Dv1%Q]l#NM}5?,>8l;0FxS2*Vt[ob$zd|&u+H$<xK' );
define( 'LOGGED_IN_KEY',     'F^cO7BWr9p,qu8WK:|<;L7+&3E%|vSgn;(3d:pj*^UQY~OPW(j(n}D.ocNvQTC9U' );
define( 'NONCE_KEY',         'NhiM2G}%TR,uLE4F*=^l_(FhQZR#DtN#4uymI.;WH>[ww4XU~ps4nMKkuc NoX~~' );
define( 'AUTH_SALT',         'P#])31maod8V#Dw!!L*kj=T<pSY,ubStI:Ih~;i6K&0TPBzd<:!9x1ngAbV&o&<K' );
define( 'SECURE_AUTH_SALT',  'ZCT?-~ -}[.Vju?,e#milZ[cR*F3/kb@yDFHm_vXQ<8OocgR<[ImLhEWv~`*w<yD' );
define( 'LOGGED_IN_SALT',    ')k;dcgs:zO&!EknT[v$`IM>DDbI&^qbGFi`S&_be<o$Kw#aqGw!^J_Q4L-[eyho#' );
define( 'NONCE_SALT',        'Q[<Tui*;3Qxq}b4|ex<wN#MGm~WJw#p!0{vZ}[;on.H]j7_v}tJv9<,?m?#P]cc{' );
define( 'WP_CACHE_KEY_SALT', 'ZH y{%=}Cot:VaWASfnFffWX}JXt#,uGSu}w#&g?-T*M[Q%[?ca`v;W[r+3,:Bvi' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
