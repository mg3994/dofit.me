<?php
/**
 * Plugin Name: App Custom API
 * Plugin URI: http://dofit.me
 * Description: All API Endpoint For Mobile App
 * Version: 1.0.0
 * Author: Antinna
 * Author URI: https://github.com/antinna
 * License:  GPL-2.0+
 * License URI:  http://www.gnu.org/licenses/gpl-2.0.txt
 * Text Domain:       plugin-name
 * Domain Path:       /languages
 */

// If this file is called directly, abort. app-custom-api App_Custom_Api , app_custom_api
if ( ! defined( 'WPINC' ) ) {
	die;
}
/**
 * Currently plugin version.
 * Start at version 1.0.0 and use SemVer - https://semver.org
 * Rename this for your plugin and update it as you release new versions.
 */
define( 'APP_CUSTOM_API_VERSION', '1.0.0' );
/**
 * The code that runs during plugin activation.
 * This action is documented in includes/class-app-custom-api-activator.php
 */
function activate_app_custom_api() {
	require_once plugin_dir_path( __FILE__ ) . 'includes/class-app-custom-api-activator.php';
	App_Custom_Api_Activator::activate();
}

/**
 * The code that runs during plugin deactivation.
 * This action is documented in includes/class-app-custom-api-deactivator.php
 */
function deactivate_app_custom_api() {
	require_once plugin_dir_path( __FILE__ ) . 'includes/class-app-custom-api-deactivator.php';
	App_Custom_Api_Deactivator::deactivate();
}

register_activation_hook( __FILE__, 'activate_app_custom_api' );
register_deactivation_hook( __FILE__, 'deactivate_app_custom_api' );

/**
 * The core plugin class that is used to define internationalization,
 * admin-specific hooks, and public-facing site hooks.
 */
require plugin_dir_path( __FILE__ ) . 'includes/class-app-custom-api.php';


/**
 * Begins execution of the plugin.
 *
 * Since everything within the plugin is registered via hooks,
 * then kicking off the plugin from this point in the file does
 * not affect the page life cycle.
 *
 * @since    1.0.0
 */
function run_app_custom_api() {

	$plugin = new App_Custom_Api();
	$plugin->run();

}
run_app_custom_api();



















// add_action( 'rest_api_init', function () {
// 	// Unguarded Routes
//     register_rest_route( 'app/v1', '/author/(?P<id>\d+)', array(
//       'methods' => 'GET',
//       'callback' => 'my_awesome_func',
//     ) );


// 	// Guarded Routes
//   } );




// //  //////////////////////////////////////////////////////////////////////////////
//  function wl_posts() {
// 	$args = [
// 		'numberposts' => 99999,
// 		'post_type' => 'post'
// 	];

// 	$posts = get_posts($args);

// 	$data = [];
// 	$i = 0;

// 	foreach($posts as $post) {
// 		$data[$i]['id'] = $post->ID;
// 		$data[$i]['title'] = $post->post_title;
// 		$data[$i]['content'] = $post->post_content;
// 		$data[$i]['slug'] = $post->post_name;
// 		$data[$i]['featured_image']['thumbnail'] = get_the_post_thumbnail_url($post->ID, 'thumbnail');
// 		$data[$i]['featured_image']['medium'] = get_the_post_thumbnail_url($post->ID, 'medium');
// 		$data[$i]['featured_image']['large'] = get_the_post_thumbnail_url($post->ID, 'large');
// 		$i++;
// 	}

// 	return $data;
// }

// function wl_post( $slug ) {
// 	$args = [
// 		'name' => $slug['slug'],
// 		'post_type' => 'post'
// 	];

// 	$post = get_posts($args);


// 	$data['id'] = $post[0]->ID;
// 	$data['title'] = $post[0]->post_title;
// 	$data['content'] = $post[0]->post_content;
// 	$data['slug'] = $post[0]->post_name;
// 	$data['featured_image']['thumbnail'] = get_the_post_thumbnail_url($post[0]->ID, 'thumbnail');
// 	$data['featured_image']['medium'] = get_the_post_thumbnail_url($post[0]->ID, 'medium');
// 	$data['featured_image']['large'] = get_the_post_thumbnail_url($post[0]->ID, 'large');

// 	return $data;
// }

// // Used in this video https://www.youtube.com/watch?v=76sJL9fd12Y
// function wl_products() {
// 	$args = [
// 		'numberposts' => 99999,
// 		'post_type' => 'products'
// 	];

// 	$posts = get_posts($args);

// 	$data = [];
// 	$i = 0;

// 	foreach($posts as $post) {
// 		$data[$i]['id'] = $post->ID;
// 		$data[$i]['title'] = $post->post_title;
//         $data[$i]['slug'] = $post->post_name;
//         $data[$i]['price'] = get_field('price', $post->ID);
//         $data[$i]['delivery'] = get_field('delivery', $post->ID);
// 		$i++;
// 	}

// 	return $data;
// }

// add_action('rest_api_init', function() {
// 	register_rest_route('wl/v1', 'posts', [
// 		'methods' => 'GET',
// 		'callback' => 'wl_posts',
// 	]);

// 	register_rest_route( 'wl/v1', 'posts/(?P<slug>[a-zA-Z0-9-]+)', array(
// 		'methods' => 'GET',
// 		'callback' => 'wl_post',
//     ) );
    
//     // Used in this video: https://www.youtube.com/watch?v=76sJL9fd12Y	
//     register_rest_route('wl/v1', 'products', [
// 		'methods' => 'GET',
// 		'callback' => 'wl_products',
// 	]);
// });