/* slock config file */


/* User and group to drop privileges to: */
static const char *user  = "matte";
static const char *group = "users";


/* Colors */
static const char *colorname[NUMCOLS] = {
	[INIT]   = "black",    /* after initialization */
	[INPUT]  = "#005577",  /* during input */
	[FAILED] = "#CC3333",  /* wrong password */
};


/* Treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
