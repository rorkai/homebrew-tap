# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.2.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.2.0/asc_4.2.0_macOS_arm64'
      sha256 '9d2a8585a481a9609b16f7dee0c5734b5229e3441e1ea371912fabdc924636e3'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.2.0/asc_4.2.0_macOS_amd64'
      sha256 'a8af0bc4a2bbfc04506548bcaae958fdc34cc5efacaeec6d4fac5ebdf6119403'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.2.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.2.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
