int findchar(const char *haystack, char needle)
{
	int i = 0;

	while (haystack[i]) {
		if (haystack[i] == needle) {
			return i;
		}
		i += 1;
	}
	return -1;
}
