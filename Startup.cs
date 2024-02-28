using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CarbonFootPrintCalculator.Startup))]
namespace CarbonFootPrintCalculator
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
