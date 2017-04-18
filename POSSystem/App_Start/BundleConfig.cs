using System.Web;
using System.Web.Optimization;

namespace POSSystem
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/lib/jquery/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/lib/jquery-validate/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/lib/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/lib/bootstrap/bootstrap.js",
                      "~/Scripts/lib/respond/respond.js"));

            bundles.Add(new ScriptBundle("~/bundles/corejs").Include(
                      "~/Scripts/lib/datatables/jquery.dataTables.js",
                      "~/Scripts/lib/datatables/dataTables.bootstrap.js",
                      "~/Scripts/lib/select/dataTables.select.js",
                      "~/assets/js/plugins/loaders/pace.min.js",
                      "~/assets/js/plugins/loaders/blockui.min.js",
                      "~/assets/js/plugins/ui/nicescroll.min.js",
                      "~/assets/js/plugins/ui/drilldown.js",
                      "~/assets/js/plugins/notifications/pnotify.min.js",
                      "~/assets/js/core/app.js"));

            bundles.Add(new ScriptBundle("~/bundles/angular").Include(
                      "~/Scripts/lib/angular/angular.js",
                      "~/Scripts/Angular/Generic.js",
                      "~/Scripts/Angular/Method.js",
                      "~/Scripts/Angular/Services.js"));


            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/lib/bootstrap/bootstrap.css",
                      "~/Content/lib/datatables/dataTables.bootstrap.css",
                      "~/Content/lib/select/select.bootstrap.css",
                      "~/Content/lib/font-awesome/font-awesome.css",
                      "~/assets/css/icons/icomoon/styles.css",
                      "~/assets/css/minified/core.min.css",
                      "~/assets/css/minified/components.min.css",
                      "~/assets/css/minified/colors.min.css",
                      "~/Content/site.css"));
        }
    }
}
