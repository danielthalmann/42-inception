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
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('WORDPRESS_DB_NAME') );

/** Database username */
define( 'DB_USER', getenv('WORDPRESS_DB_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD') );

/** Database hostname */
define( 'DB_HOST',  getenv('WORDPRESS_DB_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         '9TEcwS!?FVTzlia$vwQ:,ZQHw!s`eJ 6A~uTs)I.fuX/l[bCM_cR!EiZ6a+B~?vz' );
define( 'SECURE_AUTH_KEY',  'Mcu=}Usq]B8qacnOHyOm:G2v1Y9b^mzk:Jc<x62``T94MT6*<4`+<uH:@@JAej9S' );
define( 'LOGGED_IN_KEY',    '8hsGfr{Av~z|0secnnc4mu>R=tqutQa%G/|1s%h_CB~JQ[qXn5:>d`LOvajKg``6' );
define( 'NONCE_KEY',        ' QiRTX>JOY!{7~Yyt%xAM)!.}(sCwZ+$|meFhdt}|=+=}Zj2bdXpzX,8i- N%0JY' );
define( 'AUTH_SALT',        '3d<=<f~XmNLEILBT{6%>r*/^mCPf/5+fW-$0B*A}G+M#.#q~WZ[wybn^RV*yX*$i' );
define( 'SECURE_AUTH_SALT', 'R7&w}bM.-/;iXoBAtNS*Hvu;d6PPegolX]`@~DohAUs%,a^4I%a*~DY^>|^](a&{' );
define( 'LOGGED_IN_SALT',   '{%b]p_D+PbRA/.A$VKx.u~b7eT.pvIXb0NEM3ivs/(]^G;@=G*O)_z!L})%la`&u' );
define( 'NONCE_SALT',       '@aKQ%A3AzJ%A+j7Rrfn`=DHme)>E 0+PG?4pN3JeS2IJ6zF,>2&H]X,#ZXJ|meFM' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
